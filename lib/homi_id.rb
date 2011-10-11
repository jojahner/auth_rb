require 'omniauth/oauth'
require 'multi_json'

module OmniAuth
  module Strategies
    class HomiId < OmniAuth::Strategies::OAuth2

      def initialize(app, api_key = nil, secret_key = nil, options = {}, &block)
        client_options = {
         :site =>  CUSTOM_PROVIDER_URL,
         :authorize_url => "#{CUSTOM_PROVIDER_URL}/auth/authorize",
         :token_url => "#{CUSTOM_PROVIDER_URL}/auth/access_token"
       }
       super(app, :homi_id, api_key, secret_key, client_options, &block)
      end

      def auth_hash
        OmniAuth::Utils.deep_merge(
          super, {
            'uid' => user_data['id'],
            'user_info' => user_info,
            'extra' => {
              'user_hash' => user_data
            }
        })
      end
        
      def user_data
        @access_token.options[:mode] = :query
        @data ||= @access_token.get('/auth/user').parsed
      end

      def user_info
        {
          'username' => user_data['username'],
          'email'    => user_data['email'],
          'admin'    => user_data['admin']
        }
      end
    end
  end
end
