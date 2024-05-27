require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class StarlingSandbox < OmniAuth::Strategies::Starling

      def api_url
        "https://api-sandbox.starlingbank.com"
      end

      default_options[:client_options][:site] = "https://oauth-sandbox.starlingbank.com"
      default_options[:client_options][:token_url] = "https://api-sandbox.starlingbank.com/oauth/access-token"

    end
  end
end
