class HomeController < ApplicationController
  def index
  end

  def download_screenshots
    require 'open-uri'

    page_url = "https://steamcommunity.com/id/#{params[:user]}/screenshots/?view=grid&p=#{params[:page]}"
    response = Nokogiri::HTML(open(page_url))
    screenshot_url = response.css('a[href^="https://steamcommunity.com/sharedfiles"]')[params[:photo].to_i]['href']
    screenshot_url = Nokogiri::HTML(open(screenshot_url)).css('a[href^="https://steamuserimages-a.akamaihd.net/ugc/"]')[0]['href']

    render json: { 'url': screenshot_url }
  end
end
