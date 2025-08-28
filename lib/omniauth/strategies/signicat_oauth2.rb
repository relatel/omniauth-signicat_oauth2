require "omniauth/strategies/oauth2"

module OmniAuth
  module Strategies
    class SignicatOauth2 < OmniAuth::Strategies::OAuth2
      option :name, :signicat_oauth2
      option :account
      option :iss
      option :response_type, 'code'

      def setup_phase
        super
        options.client_options[:site] ||= "https://#{options.account}.signicat.com/auth/open"
        options.client_options[:authorize_url] ||= "https://#{options.account}.signicat.com/auth/open/connect/authorize"
        options.client_options[:token_url] ||= "https://#{options.account}.signicat.com/auth/open/connect/token"
        options.iss ||= options.client_id
      end

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

      def callback_url
        options[:callback_url]
      end

      def raw_info
        userinfo_url = "https://#{options.account}.signicat.com/auth/open/connect/userinfo"
        @raw_info ||= access_token.get(userinfo_url).parsed 

      end

    end
  end
end

