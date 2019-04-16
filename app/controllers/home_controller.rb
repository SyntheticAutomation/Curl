class HomeController < ApplicationController

    def index
      @user = User.new
      @query = params[:search]
      key = ENV['TASTEDIVE_API_KEY']
      results = TastediveService.search(@query, key)
      @type = results.body[:Similar][:Info][0][:Type] # 'music'
      @recommendations = results.body[:Similar][:Results]
    end
    

end