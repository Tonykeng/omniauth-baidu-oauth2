require "omniauth-oauth2"

module OmniAuth
  module Strategies
    class Baidu < OmniAuth::Strategies::OAuth2
      option :client_options, {
        :site           => "https://openapi.baidu.com",
        :authorize_url  => "/oauth/2.0/authorize",
        :token_url      => "/oauth/2.0/token"
      }
      option :token_params, {
        :parse          => :json
      }

      uid do
        raw_info['userid']
      end

      info do
        {
          :nickname     => raw_info['realname'],
          :name         => raw_info['username'],
          :sex          => raw_info['sex'],
          :birthday     => raw_info['birthday'],
          :description  => raw_info['userdetail'],
          :image => {
            'small'      => "http://tb.himg.baidu.com/sys/portraitn/item/#{raw_info['url']}",
            'large'     => "http://tb.himg.baidu.com/sys/portrait/item/#{raw_info['url']}",
          }
        }
      end

      extra do
        {
          :raw_info => raw_info
        }
      end

      def raw_info
        access_token.options[:mode] = :query
        access_token.options[:param_name] = 'access_token'
        @uid ||= access_token.get('/rest/2.0/passport/users/getLoggedInUser').parsed["uid"]
        @raw_info ||= access_token.get("/rest/2.0/passport/users/getInfo", :params => {:uid => @uid}).parsed
      end

      ##
      # You can pass +display+, +with_offical_account+ or +state+ params to the auth request, if
      # you need to set them dynamically. You can also set these options
      # in the OmniAuth config :authorize_params option.
      #
      # /auth/baidu?display=mobile&with_offical_account=1
      #
      def authorize_params
        super.tap do |params|
          %w[display with_offical_account state forcelogin].each do |v|
            if request.params[v]
              params[v.to_sym] = request.params[v]

              # to support omniauth-oauth2's auto csrf protection
              session['omniauth.state'] = params[:state] if v == 'state'
            end
          end
        end
      end
      
    end
  end
end

OmniAuth.config.add_camelization "baidu", "Baidu"
