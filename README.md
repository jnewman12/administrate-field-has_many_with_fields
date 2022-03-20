# Administrate::Field::HasManyWithFields

An administrate plug-in designed to allow you to only show certain fields when rendering a `has_many` relationship instead of rendering entire collection's dashboard. Extends the `Administrate::Field::HasMany` field.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'administrate-field-has_many_with_fields'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install administrate-field-has_many_with_fields

## Usage

Turn the standard `has_many` relationship in your administrate dashboard from this

```ruby
class UserDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    posts: Field::HasMany,
    # ...
  }
```

into this

```ruby
class UserDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    posts: Field::HasManyWithFields.with_options(fields: [:id, :attr_1, :attr_2, :method_1]),
    # ...
  }
```

The standard administrate `with_options` method (limit, class_name, etc) still works because this inherits from `Administrate::Field::HasMany`. The `fields` array also works with both model attributes and model methods.


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
