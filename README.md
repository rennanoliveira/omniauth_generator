# OmniauthGenerator

Simple Gem created because I kept repeating the same simple steps everytime I used omniauth

## Usage

Description:
    Generates all files needed for basic omniauth 'login with facebook or twitter'

Example:
    rails generate omniauth_initializer Session

    This will create:
        config/api_keys.yml <- Set your app keys here.
        config/initializers/omniauth_initializer.rb <- choose the providers you will use
        app/controllers/sessions_controller.rb <- sample controller

    And add a route to your routes.rb file:
        get '/auth/:provider/callback', :to => 'sessions#create'

## Contributing

1. Fork it ( http://github.com/rennanoliveira/omniauth_generator/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. ADD TESTS.
4. Commit your changes (`git commit -am 'Add some feature'`)
5. Push to the branch (`git push origin my-new-feature`)
6. Create new Pull Request
