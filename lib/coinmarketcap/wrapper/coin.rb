module Coinmarketcap
  module Wrapper
    class Coin < ApiClient
      def self.all(**opts)
        attributes = JSON.parse(fetch_all(opts))
        clean_data(attributes, **opts)
        attributes.map { |attribute| new(attribute)}
      end

      def self.find(id, **opts)
        attributes = JSON.parse(fetch_single(id, opts))
        clean_data(attributes, **opts)
        new(attributes.first)
      end
    end
  end
end
