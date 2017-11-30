module Coinmarketcap
  module Wrapper
    COIN_PATH = 'ticker'

    class Coin < ApiClient
      class << self
        def all(**opts)
          response = Faraday.get "#{BASE_API_URL}/#{COIN_PATH}/", opts
          attributes = JSON.parse(response.body)
          clean_data(attributes, **opts)
          attributes.map { |attribute| new(attribute)}
        end

        def find(id, **opts)
          response = Faraday.get "#{BASE_API_URL}/#{COIN_PATH}/#{id}/", opts
          attributes = JSON.parse(response.body)
          clean_data(attributes, **opts)
          new(attributes.first)
        end
      end
    end
  end
end
