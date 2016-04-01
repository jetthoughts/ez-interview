class InterviewTemplatesController < ApplicationController
  before_action :set_interview_template, only: [:show, :edit, :update, :destroy]

  # GET /interview_templates
  # GET /interview_templates.json
  def index
    @interview_templates = InterviewTemplate.all
  end

  # GET /interview_templates/1
  # GET /interview_templates/1.json
  def show
  end

  # GET /interview_templates/new
  def new
    @interview_template_form_props = { name: '', templateQuestions: [] }
  end

  # GET /interview_templates/1/edit
  def edit
  end

  # POST /interview_templates
  # POST /interview_templates.json
  def create
    @interview_template = InterviewTemplate.new(interview_template_params)

    respond_to do |format|
      if @interview_template.save
        format.html { redirect_to @interview_template, notice: 'Template was successfully created.' }
        format.json { render :show, status: :created, location: @interview_template }
      else
        format.html { render :new }
        format.json { render json: @interview_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /interview_templates/1
  # PATCH/PUT /interview_templates/1.json
  def update
    respond_to do |format|
      if @interview_template.update(interview_template_params)
        format.html { redirect_to @interview_template, notice: 'Template was successfully updated.' }
        format.json { render :show, status: :ok, location: @interview_template }
      else
        format.html { render :edit }
        format.json { render json: @interview_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /interview_templates/1
  # DELETE /interview_templates/1.json
  def destroy
    @interview_template.destroy
    respond_to do |format|
      format.html { redirect_to interview_templates_url, notice: 'Template was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_interview_template
      @interview_template = InterviewTemplate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def interview_template_params
      params.require(:interview_template).permit(:name)
    end
end
