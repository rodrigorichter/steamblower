class HomeController < ApplicationController
    def index
    end

    def get_screenshot_url
        require 'open-uri'

        return_url = ''
        page_url = "https://steamcommunity.com/id/#{params[:user]}/screenshots/?view=grid&p=#{params[:page]}"
        will_have_second_try = true
        has_requested_already = false

        while will_have_second_try
            response = Nokogiri::HTML(open(page_url))
            if response != nil
                screenshot_url = response.css('a[href^="https://steamcommunity.com/sharedfiles"]')

                if !screenshot_url.empty?
                    screenshot_url = screenshot_url[params[:photo].to_i]

                    if screenshot_url != nil

                        screenshot_url = screenshot_url['href']
                        screenshot_url = Nokogiri::HTML(open(screenshot_url)).css('a[href^="https://steamuserimages-a.akamaihd.net/ugc/"]')[0]['href']
                        return_url = screenshot_url
                        will_have_second_try = false
                    end
                end
            end

            if return_url == ''
                if !has_requested_already
                    has_requested_already = true
                    will_have_second_try = true
                else
                    will_have_second_try = false
                end
            end

        end

        render json: { 'url': return_url }
    end

end
