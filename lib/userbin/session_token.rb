require 'jwt'

module Userbin
  class SessionToken
    def initialize(token)
      if token
        @jwt = Userbin::JWT.new(token)
      end
    end

    def to_s
      @jwt.to_token
    end

    def expired?
      @jwt.expired?
    end

    def needs_challenge?
      @jwt.payload['vfy'] > 0
    end

    def has_challenge?
      @jwt.payload['chg'] == 1
    end

    def mfa_enabled?
      @jwt.payload['mfa'] == 1
    end

    def device_trusted?
      @jwt.payload['tru'] == 1
    end
  end
end
