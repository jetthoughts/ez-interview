class ::Editor::LoadSource
  def perform(room_id, source)
    connection.post "/rooms/#{room_id}", content: source
  end

  def connection
    @connection ||=  Faraday.new(url: EditorsController::EDITOR_URL) do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end
  end
end