# QryFilter
*Note: This is a work in progress and should not be used in production.*

QryFilter aka "QueryFilter" is a simple Rails gem that provides a pattern and helper when dealing with lots of filter clauses in your ActiveRecord query.

## Usage
**Filter Class**
You can define this inside ```app/filters```.
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

**Class Method**
```ruby
QryFilter.compose(scope, filter_hash: params)
QryFilter.compose(scope, filter_hash: params, filter_by: [:id, :age])
QryFilter.compose(scope, filter_hash: params, filter_by: [:id, :age], filter_class: UserFilter)
```

**Helper**
```ruby
filter scope, filter_hash: params
filter scope, filter_hash: params, filter_by: [:id, :age]
filter scope, filter_hash: params, filter_by: [:id, :age], filter_class: UserFilter
```

## TODO
- Autodetect Model name to match with Filter class
- Work with ActiveRecord::Relation
- Generator for ApplicationFilter
- More tests

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
