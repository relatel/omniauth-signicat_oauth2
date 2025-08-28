# OmniAuth::SignicatOauth2

OmniAuth strategy for Signicat using OAuth 2.0.

## Usage

Here's an example for adding the middleware to a Rails application using devise in `config/initializers/devise.rb`:

```ruby
  config.omniauth :signicat_oauth2,
    ENV['SIGNICAT_OAUTH2_CLIENT_ID'],
    ENV['SIGNICAT_OAUTH2_CLIENT_SECRET'],
    {
      account: ENV['SIGNICAT_OAUTH2_ACCOUNT'],
      scope: 'openid email profile',
      prompt: 'select_account',
      callback_url: ,
    }
```

### Options

- `account`: Your Signicat account name. This is used to construct the authorization and token URLs.
- `scope`: A space-separated list of permissions to request.
- `prompt`: Can be `select_account` to force the user to select an account.
- `callback_url`: The callback endpoint on the site that is requesting authentication

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
