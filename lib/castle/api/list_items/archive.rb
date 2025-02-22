# frozen_string_literal: true

module Castle
  module API
    # Namespace for the list items API ednpoints
    module ListItems
      # Sends DELETE /lists/:list_id/items/:item_id request
      module Archive
        class << self
          # @param options [Hash]
          # @return [Hash]
          def call(options = {})
            options = Castle::Utils::DeepSymbolizeKeys.call(options || {})
            http = options.delete(:http)
            config = options.delete(:config) || Castle.config

            Castle::API.call(Castle::Commands::ListItems::Archive.build(options), {}, http, config)
          end
        end
      end
    end
  end
end
