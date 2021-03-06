class QuestionsController < ApplicationController
  self.current_menu_item = 'Questions'

  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :require_team

  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.all
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
  end

  # GET /questions/new
  def new
    @question = Question.new
    @categories = Category.all
  end

  # GET /questions/1/edit
  def edit
    @categories = Category.all
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(question_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: 'Question was successfully created.' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    def question_params
      params.require(:question).permit(:title, :body, :source_code, :category_id, :difficulty)
    end

    def require_team
      if current_user.team_memberships.owner.none? && current_user.team_memberships.confirmed.none?
        redirect_to new_team_path, flash: { notice: 'Please create or join team first' }
      elsif !session[:current_team]
        redirect_to teams_path, flash: { notice: 'Please choose team first'}
      end
    end
end
