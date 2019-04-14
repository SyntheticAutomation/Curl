require 'rails_helper'

describe 'A user who visits the app' do
    describe 'when they navigate to the home page' do
        it 'displays the site Logo in the top left corner of the page' do
            
            visit home_index_path

            within ".nav" do
                expect(page).to have_content("logo")
            end
        end
    end
end