# frozen_string_literal: true

module Castle
  module Context
    class GetDefault
      def initialize(request, cookies = nil)
        @pre_headers = Castle::Headers::Filter.new(request).call
        @cookies = cookies || request.cookies
        @request = request
      end

      def call
        {
          active: true,
          library: {
            name: 'castle-rb',
            version: Castle::VERSION
          }
        }.tap do |result|
          result[:user_agent] = user_agent if user_agent
        end
      end

      private

      # @return [String]
      def user_agent
        @pre_headers['User-Agent']
      end
    end
  end
end
