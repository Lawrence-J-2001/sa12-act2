require 'httparty'
require 'json'

response = HTTParty.get('https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd')
crypto_data = JSON.parse(response.body)

if crypto_data
    descending_order = crypto_data.sort_by { |crypto| -crypto['market_cap'] }

    index = 0
    while index < 5
        cryptocurrency = descending_order[index]
        puts "Name: #{cryptocurrency['name']}"
        puts "Current price: #{cryptocurrency['current_price']}"
        puts "Market cap value: #{cryptocurrency['market_cap']}"
        puts " "
        index = index + 1
    end
else
    puts "Error"
end