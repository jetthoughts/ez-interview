class EditorsController < ApplicationController
  EDITOR_URL = 'http://localhost:3001'

  layout 'editor'

  def show
    @interview = Interview.find_by!(unique_id: params[:id])
    @editor_url = EDITOR_URL
  end
end