class EditorsController < ApplicationController
  DEFAULT_LANGUAGE = 'ruby'.freeze
  EDITOR_URL = 'http://localhost:3001'
  RUNNER_URL = 'http://192.168.89.17:4567'

  layout 'editor'

  skip_before_action :require_login

  def show
    @interview = Interview.find_by!(unique_id: params[:id])
    @editor_url = EDITOR_URL

    if params[:answer_id]
      @answer = Answer.find(params[:answer_id])
      @language = @answer.language
    else
      @language = DEFAULT_LANGUAGE
    end
  end
end