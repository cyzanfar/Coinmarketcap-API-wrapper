require "coinmarketcap/wrapper/version"
require "coinmarketcap/wrapper/api_client"
require "coinmarketcap/wrapper/coin"
require "coinmarketcap/wrapper/market_data"
require 'json'
require 'api_cache'
require "moneta"
require "memcached"
# require 'dalli'

module Coinmarketcap
  module Wrapper
    BASE_API_URL = "https://api.coinmarketcap.com/v1"

    APICache.store = Moneta.new(:Memcached)
  end
end
