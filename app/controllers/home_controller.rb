class HomeController < ApplicationController
    def index
    end

    def get_screenshot_url
        require 'open-uri'

        return_url = ''
        page_url = "https://steamcommunity.com/profiles/#{params[:user]}/screenshots/?view=grid&p=#{params[:page]}"
        tries_left = 3

        while tries_left > 0
            response = Nokogiri::HTML(open(page_url))
            if response != nil
                screenshot_url = response.css('a[href^="https://steamcommunity.com/sharedfiles"]')

                if !screenshot_url.empty?
                    screenshot_url = screenshot_url[params[:photo].to_i]

                    if screenshot_url != nil

                        screenshot_url = screenshot_url['href']
                        screenshot_url = Nokogiri::HTML(open(screenshot_url)).css('a[href^="https://steamuserimages-a.akamaihd.net/ugc/"]')[0]['href']
                        return_url = screenshot_url
                        tries_left = 0
                    end
                end
            end

                tries_left = tries_left - 1
        end

        render json: { 'url': return_url }
    end

end
