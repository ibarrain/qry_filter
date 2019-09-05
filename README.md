# QryFilter
Warning: This is a work in progress and should not be used in production.

This is a simple Rails gem for handling query filters.
Filter classes should be defined in 'app/lib/filters' e.g. UserFilter.

## Usage (in the future)
Filter Class:
```ruby
class UserFilter
  def default
    by_id
    by_age
  end

  def by_id
    @scope = @scope.where(id: filter_hash[:id])
  end

  def by_age
    @scope = @scope.where(age: filter_hash[:age])
  end
end
```

Class Method:
```ruby
QryFilter.compose(scope, filter_hash: params)
QryFilter.compose(scope, filter_hash: params, filter_by: [:id, :age])
QryFilter.compose(scope, filter_hash: params, filter_by: [:id, :age], filter_class: UserFilter)
```

Helper:
```ruby
filter User, filter_hash: params
filter User, filter_hash: params, filter_by: [:id, :age]
filter User, filter_hash: params, filter_by: [:id, :age], filter_class: UserFilter
```

#TODO
-Autodetect Filter Class
-Work with ActiveRecord::Relation
-Generator for ApplicationFilter
-More tests

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

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
