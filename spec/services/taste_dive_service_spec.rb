require 'rails_helper'

describe 'TasteDive API Service' do
  it 'can make calls', :vcr do
    query_words = 'American Gangster'
    key = ENV['TASTEDIVE_API_KEY']

    response = TastediveService.search(query_words, key)
    expected = response.body[:Similar][:Info][0][:Name]

    expect(expected).to eq("American Gangster")
  end
end