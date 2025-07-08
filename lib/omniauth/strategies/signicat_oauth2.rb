require "omniauth/strategies/oauth2"

module OmniAuth
  module Strategies
    class SignicatOauth2 < OmniAuth::Strategies::OAuth2
      option :name, :signicat_oauth2

      option :client_options, {}

      option :scope, "openid profile email"

      uid { raw_info["sub"] }

      info do
        {
          name: raw_info["name"],
          email: raw_info["email"]
        }
      end

      extra do
        {
          "raw_info" => raw_info
        }
      end

      def raw_info
        @raw_info ||= access_token.get("/oidc/userinfo").parsed
      end
    end
  end
end
