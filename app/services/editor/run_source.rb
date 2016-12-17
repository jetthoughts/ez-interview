class ::Editor::RunSource
  def perform(source)
    connection.post '/run', code: source
  end

  def connection
    @connection ||=  Faraday.new(url: EditorsController::RUNNER_URL) do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end
  end
end