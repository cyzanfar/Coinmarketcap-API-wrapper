module Coinmarketcap
  module Wrapper
      GLOBAL_DATA_PATH = 'global'
    class MarketData < ApiClient

      def self.global(**opts)
        response = Faraday.get "#{BASE_API_URL}/#{GLOBAL_DATA_PATH}/", opts
        attributes = JSON.parse(response.body)
        new(attributes)
      end
    end
  end
end
