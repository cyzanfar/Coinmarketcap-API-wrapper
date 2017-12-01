module Coinmarketcap
  module Wrapper
    class ApiClient

        def initialize(attributes)
          attributes.each do |attribute, value|
            singleton_class.class_eval { attr_accessor "#{attribute}"}
            send("#{attribute}=", value)
          end
        end

      class << self
        def clean_data(attributes, **opts)
          attributes.each do |attribute|
            attribute['day_volume_usd'] = attribute.delete '24h_volume_usd'
            if opts[:convert]
              attribute["day_volume_#{opts[:convert].downcase}"] =
              attribute.delete "24h_volume_#{opts[:convert].downcase}" if opts[:convert]
            end
          end
          attributes
        end

        def fetch_single(id, opts={})
          uri = URI("#{BASE_API_URL}/ticker/#{id}/")
          uri.query = URI.encode_www_form(opts)
          res = Net::HTTP.get_response(uri)
          res.body
        end

        def fetch_all(opts={}, cache_time=100)
          APICache.get('coinmarketcap_data', :cache => cache_time) do
            uri = URI("#{BASE_API_URL}/ticker/")
            uri.query = URI.encode_www_form(opts)
            res = Net::HTTP.get_response(uri)
            case res
            when Net::HTTPSuccess
              res.body
            else
              raise APICache::InvalidResponse
            end
          end
        end
      end
    end
  end
end
