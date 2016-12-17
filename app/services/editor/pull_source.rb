class ::Editor::PullSource
  attr_reader :room_id

  def initialize(room_id)
    @room_id = room_id
  end

  def perform
    parsed_content(connection.get("/rooms/#{room_id}"))
  end

  private

  def connection
    @connection ||=  Faraday.new(url: EditorsController::EDITOR_URL) do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end
  end

  def parsed_content(response)
    JSON.parse(response.body)['collections']['rooms'][room_id.to_s]['data']['content']
  end
end