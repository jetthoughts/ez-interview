class EditorsController < ApplicationController
  EDITOR_URL = 'http://localhost:3001'

  layout 'editor'

  skip_before_action :require_login

  def show
    @interview = Interview.find_by!(unique_id: params[:id])
    @editor_url = EDITOR_URL
    @answer = Answer.find(params[:answer_id])
  end
end