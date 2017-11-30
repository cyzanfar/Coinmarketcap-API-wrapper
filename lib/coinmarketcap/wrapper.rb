require "coinmarketcap/wrapper/version"
require "coinmarketcap/wrapper/api_client"
require "coinmarketcap/wrapper/coin"
require "coinmarketcap/wrapper/market_data"
require 'faraday'
require 'json'

module Coinmarketcap
  module Wrapper
    BASE_API_URL = "https://api.coinmarketcap.com/v1"
  end
end
