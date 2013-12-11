# Oauth2::Baidu

OmniAuth Oauth2 strategy for baidu.com

http://developer.baidu.com/wiki/index.php?title=docs/oauth

## Installation

Add this line to your application's Gemfile:

    gem 'omniauth-baidu-oauth2'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install omniauth-baidu-oauth2

## Usage

`OmniAuth::Strategies::Baidu` is simply a Rack middleware. Read the OmniAuth 1.0 docs for detailed instructions: https://github.com/intridea/omniauth.

Here's a quick example, adding the middleware to a Rails app in `config/initializers/omniauth.rb`:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :baidu, ENV['BAIDU_KEY'], ENV['BAIDU_SECRET']
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

MIT
