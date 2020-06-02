# SocialMedia
Add social media functionality such as liking, following, reporting, and blocking to your Rails application.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'social_media'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install social_media
```

## Usage
After installing the gem in your application, you need to copy the migrations from the gem to your application:
```bash
rails social_media:install:migrations
```

This will copy the namespaced migrations for the models in the gem to your app.



## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
