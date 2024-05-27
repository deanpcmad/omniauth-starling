# OmniAuth Starling

An OmniAuth strategy for Starling

## Installation

Add the OmniAuth Starling and OmniAuth rails_csrf_protection gems to your Gemfile

```ruby
gem 'omniauth-starling'
gem 'omniauth-rails_csrf_protection'
```

## Usage

You can create an application on the [Starling Developer Portal](https://developer.starlingbank.com/) and get your app and secret keys.

Here's an example for adding the middleware to a Rails app in `config/initializers/omniauth.rb`:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :starling, ENV["STARLING_APP"], ENV["STARLING_SECRET"]
end
```

Or for a Starling Sandbox application:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :starlingsandbox, ENV["STARLING_APP"], ENV["STARLING_SECRET"]
end
```
