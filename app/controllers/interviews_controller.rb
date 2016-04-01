class InterviewsController < ApplicationController
  self.current_menu_item = 'Interviews'

  before_action :set_interview, only: [:show, :edit, :update, :destroy, :add_question,
                                       :create_question, :delete_answer, :conduct, :rate_answer]

  # GET /interviews
  # GET /interviews.json
  def index
    @interviews = Interview.all
  end

  # GET /interviews/1
  # GET /interviews/1.json
  def show
    @answers = @interview.answers.includes(:question)
  end

  # GET /interviews/new
  def new
    @interview = Interview.new
  end

  # GET /interviews/1/edit
  def edit
  end

  def add_question
    @questions = Question.all
  end

  def create_question
    @question = Question.find(params[:question_id])
    @interview.answers << Answer.new(question: @question, mark: 0)
    @interview.save!
    redirect_to @interview
  end

  def delete_answer
    @answer = Answer.find(params[:answer_id])
    @answer.destroy!
    redirect_to @interview
  end

  # POST /interviews
  # POST /interviews.json
  def create
    @interview = Interview.new(interview_params)

    respond_to do |format|
      if @interview.save
        format.html { redirect_to @interview, notice: 'Interview was successfully created.' }
        format.json { render :show, status: :created, location: @interview }
      else
        format.html { render :new }
        format.json { render json: @interview.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /interviews/1
  # PATCH/PUT /interviews/1.json
  def update
    respond_to do |format|
      if @interview.update(interview_params)
        format.html { redirect_to @interview, notice: 'Interview was successfully updated.' }
        format.json { render :show, status: :ok, location: @interview }
      else
        format.html { render :edit }
        format.json { render json: @interview.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /interviews/1
  # DELETE /interviews/1.json
  def destroy
    @interview.destroy
    respond_to do |format|
      format.html { redirect_to interviews_url, notice: 'Interview was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # GET /interviews/1/process
  def conduct
    if params[:answer_id]
      @answer = @interview.answers.find(params[:answer_id])
    else
      @answer = @interview.answers.load.first
    end
    index = @interview.answers.index(@answer)
    @previous_answer = @interview.answers.at(index-1) if index > 0
    @next_answer = @interview.answers.at(index+1) if index < @interview.answers.size - 1
  end

  # PATCH
  def rate_answer
    @answer = @interview.answers.find(params[:answer_id])
    @answer.update(answer_params)
    respond_to do |format|
      format.json { render json: { errors: @answer.errors.full_messages } }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_interview
      @interview = Interview.find(params[:id] || params[:interview_id])
    end

    def answer_params
      params.require(:answer).permit(:text, :comment, :mark)
    end

    def interview_params
      params.require(:interview).permit(:name, :appointed_at)
    end
end
