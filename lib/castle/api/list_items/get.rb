# frozen_string_literal: true

module Castle
  module API
    module ListItems
      # Sends GET /lists/:list_id/items/:item_id request
      module Get
        class << self
          # @param options [Hash]
          # @return [Hash]
          def call(options = {})
            options = Castle::Utils::DeepSymbolizeKeys.call(options || {})
            http = options.delete(:http)
            config = options.delete(:config) || Castle.config

            Castle::API.call(Castle::Commands::ListItems::Get.build(options), {}, http, config)
          end
        end
      end
    end
  end
end
