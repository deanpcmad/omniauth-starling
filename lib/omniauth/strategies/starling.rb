require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Starling < OmniAuth::Strategies::OAuth2

      DEFAULT_SCOPE = "customer:read".freeze

      def api_url
        "https://api.starlingbank.com"
      end

      option :client_options, {
        site: "https://oauth.starlingbank.com",
        token_url: "https://api.starlingbank.com/oauth/access-token",
        auth_scheme: :request_body
      }

      option :access_token_options, {
        header_format: "Bearer %s",
        param_name: "access_token"
      }

      option :authorize_options, [:scope]

      uid { raw_info["account_holder_uid"] }

      extra do
        {
          raw_info: raw_info
        }
      end


      def callback_url
        return options[:redirect_uri] unless options[:redirect_uri].nil?
        full_host + script_name + callback_path
      end

      def raw_info
        @raw_info ||= access_token.get("#{api_url}/api/v2/account-holder").parsed
      end

      def authorize_params
        super.tap do |params|
          options[:authorize_options].each do |k|
            params[k] = request.params[k.to_s] unless [nil, ''].include?(request.params[k.to_s])
          end
          params[:scope] = params[:scope] || DEFAULT_SCOPE
        end
      end

    end
  end
end
