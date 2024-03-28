require 'httparty'
require 'json'

response = HTTParty.get('http://worldtimeapi.org/api/timezone/Europe/London')
setting = JSON.parse(response.body)

if setting
    puts "The current time in #{setting['timezone']} is #{setting['datetime']}"
else
    puts "Error"
end