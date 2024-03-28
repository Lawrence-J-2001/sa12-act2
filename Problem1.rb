require 'httparty'
require 'json'

response = HTTParty.get("https://api.github.com/users/Lawrence-J-2001/repos")
repositories = JSON.parse(response.body)

if repositories
    highest_stars = repositories.max_by { |repositories| repositories['stargazers_count'] }

    puts "Name: #{highest_stars['name']}"
    puts "Description: #{highest_stars['description']}"
    puts "Number of stars: #{highest_stars['stargazers_count']}"
    puts "URL: #{highest_stars['html_url']}"
else
    puts "Error"
end