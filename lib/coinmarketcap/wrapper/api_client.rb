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
    end
  end
end
