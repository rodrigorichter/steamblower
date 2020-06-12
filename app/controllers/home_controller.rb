class HomeController < ApplicationController
  def index
  end

  def download_screenshots
    reponse = HTTParty.get('http://www.google.com')
    puts response.body
    debugger
    render json: { 'user': response.body }
  end
end
