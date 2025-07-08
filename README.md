## Installation

```ruby
gem 'omniauth-signicat_oauth2'
```

## Usage

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider  :signicat_oauth2,     
            ENV['SIGNICAT_OAUTH2_CLIENT_ID'],
            ENV['SIGNICAT_OAUTH2_CLIENT_SECRET'],
            { 
              client_options: {
                site: "",
                authorize_url: "",
                token_url: ""
              },
              scope: 'openid email profile',
              prompt: 'select_account',
            }
end
```