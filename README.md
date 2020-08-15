# Steamblower

[Steamblower](https://steamblower.herokuapp.com/) is a web application that scrapes your steam profile and hands it to you all your public screenshots, so you can batch download them with an extension/download manager

![demo](https://user-images.githubusercontent.com/15044782/90322212-cc264480-df27-11ea-9f6a-a394596fc1de.png)

## Usage
Just head to the [steamblower page](https://steamblower.herokuapp.com/), type your SteamID, and it's done!

## How It Works
This project is a `rails` application hosted on `heroku`.
1. Your SteamID provides a unique URL for your steam profile.
2. Your browser requests the screenshots from the app through multiple asynchronous requests.
3. The app uses the `nokogiri` gem to parse the HTML of your steam screenshots page and collects the image's url.
4. The browser receives the url and prints it on a text input on the Steamblower page.
5. This process goes on until nokogiri can't find more screenshots.
6. Even though this is not the most efficient way, it allows for a simple implementation and real-time results on the user's screen.

For an implementation that would improve performance significantly, a server-side background job could run for each user. This job would scrape all screenshots in a single method, making very few requests to the steam servers. Then the user would send timed requests to steamblower and receive a list of many screenshots, instead of sending a request for each screenshot. A unique, temporary identifier would be set for each user.

## Liked it? Help spread it further!
[This application](https://steamblower.herokuapp.com/) was created by me when I found myself wanting to download my 300 steam screenshots, and finding out they weren't stored locally on my PC. After extensive google research, I found some outdated windows programs and a javascript script that didn't work. This application works great(tested on aug 15, 2020) and will be updated if steam changes anything on their front-end. If you found it useful yourself, consider reaching out to other steam tools, forums and websites and bring more attention to this tool.

## Contributing
1. Clone this repository.
2. Run it locally and make some changes! It is a simple app running Rails 6 and shouldn't cause any installation hiccups.
3. Submit a pull request.
