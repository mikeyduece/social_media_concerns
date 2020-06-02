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

Once the migrations are run, you will then need to include the modules in the respective models.
```ruby
class User < ApplicationRecord
  include SocialMedia::Concerns::Likeable
  include SocialMedia::Concerns::Follwable
  include SocialMedia::Concerns::Blockable
  include SocialMedia::Concerns::Reportable

  likeable :items
  followable :users
  follower :users
  reportable :users, :items
  ...
end
````

### How to create social media objects

After mounting the engine `mount SocialMedia::Engine => '/social_media'`,

simply send `POST` or `DELETE` requests with the the relevant top level key, ie:
```json
{
  "like": {
    "owner_id": 1,
    "owner_type": "user",
    "target_id": 1,
    "target_type": "item"
  }
}
```
With `"like"` being substituted for the relevant `SocialMedia` module: `like, follow, block, report`
 
   - Routes for each are:
     - Like
       - `/likes`
     - Follow
       - `follows`
     - Block
       - `/blocks`
     - Report
       - `/reports`


## Contributing
Coming Soon

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
