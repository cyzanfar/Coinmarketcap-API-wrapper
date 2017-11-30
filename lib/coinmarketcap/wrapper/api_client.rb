module Coinmarketcap
  module Wrapper
    class ApiClient
      def initialize(attributes)
        attributes.each do |attribute, value|
          singleton_class.class_eval { attr_accessor "#{attribute}"}
          send("#{attribute}=", value)
        end
      end

      def self.clean_data(attributes, **opts)
        attributes.each do |attribute|
          attribute['day_volume_usd'] = attribute.delete '24h_volume_usd'
          if opts[:convert]
            attribute["day_volume_#{opts[:convert].downcase}"] =
            attribute.delete "24h_volume_#{opts[:convert].downcase}" if opts[:convert]
          end
        end
      end

      def self.call_for(path, cache_time=200, opts = {})
        APICache.get('coinmarketcap_data', :cache => cache_time) do
          Net::HTTP.start(BASE_API_URL) do |http|
            req = Net::HTTP::Get.new "/#{path}/")
            req.set_form_params opts
            binding.pry
            response = http.request(req)
            case response
            when Net::HTTPSuccess
              # 2xx response code
              response.body
              binding.pry
            else
              raise APICache::InvalidResponse
            end
          end
        end
      end
    end
  end
end
