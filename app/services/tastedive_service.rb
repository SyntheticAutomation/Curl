class TastediveService

  def self.conn(query_words, key)
    Faraday.new(url: 'https://tastedive.com') do |faraday|
      faraday.params["q"] = query_words
      faraday.params["k"] = key
      faraday.response :json, :parser_options => {symbolize_names: true}
      faraday.adapter Faraday.default_adapter
    end
  end

  def self.search(query_words, key)
    conn(query_words, key).get('/api/similar')
  end
end
