[![Gem Version](https://badge.fury.io/rb/qry_filter.svg)](https://badge.fury.io/rb/qry_filter)
![](https://github.com/inaki-ibarra/qry_filter/workflows/CI/badge.svg)
![](https://github.com/inaki-ibarra/qry_filter/workflows/CD/badge.svg)

# QryFilter
QryFilter aka "QueryFilter" is a simple Rails gem that provides a pattern and helper when dealing with lots of filter clauses in your ActiveRecord query.

## Usage
**Filter Class**
```ruby
# app/filters/user_filter.rb
class UserFilter < ApplicationFilter
  def by_id
    @scope = @scope.where(id: @filter_hash[:id])
  end

  def by_age
    @scope = @scope.where(age: @filter_hash[:age])
  end
end
```

**In Controller**
```ruby
# app/controllers/user_controller.rb
class UsersController < ApplicationController
  def index
    users = filter User, params
    # ...
  end
end
```

**Other options**

Class Method:
```ruby
params = {id: [1, 2, 3], age: [18, 20]}
users = User.where(happy: true)

QryFilter.compose(users, params, filter_by: [:id, :age], filter_class: UserFilter)
```
Helper:
```ruby
filter User, params, filter_by: [:id, :age], filter_class: UserFilter
```
- The first argument accepts ActiveRecord::Relation or model class name.
- The second is for key-value pair of data you want to pass to your filter class.
- The last argument is a hash and allows you to set ```filter_by``` and ```filter_class```
- ```filter_by``` maps with your filter class methods e.g. ```[:id]``` will only trigger ```by_id``` method. If empty, all filters will be triggered.
- ```filter_class``` allows you to set a specific class when needed.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'qry_filter'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install qry_filter
```

Generate app/filters/application_filter.rb:
```bash
$ rails g qry_filter:install
```

Include QryFilter in ApplicationController
```ruby
class ApplicationController < ActionController::Base
  include QryFilter
end
```

## Contributing
Fork the repo and submit a pull request.
Please follow this [Rails style guide](https://github.com/rubocop-hq/rails-style-guide).

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
