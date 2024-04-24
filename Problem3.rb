require 'httparty'
require 'json'

response = HTTParty.get('http://worldtimeapi.org/api/timezone/Europe/London')
setting = JSON.parse(response.body)

if setting
    datetime = setting['utc_datetime']
    date = datetime.slice(0,10)
    time = datetime.slice(12,7)
    puts "The current time in #{setting['timezone']} is #{date} #{time}"
else
    puts "Error"
end