<div align="center">
    
#### A Ruby style guide by

[![](https://cdn1.treatwell.net/images/view/v2.i1756348.w200.h50.x4965194E.jpeg)](https://treatwell.com/tech)

</div>

# Usage

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rubocop-treatwell'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install rubocop-treatwell

## Usage

Add the following to the top of your `.rubocop.yml`:

```yaml
inherit_gem:
  rubocop-treatwell: rubocop-treatwell-style.yml
```

And run:

```bash
bundle exec rubocop
```

## Development

After checking out the repo, run `bin/setup` to install dependencies.

To add a new cop, run `bundle exec rake 'new_cop[Foobar/SuperCoolCopName]'`

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

### Testing

You can execute a smoke test with `bundle exec rspec`. Check it is success before open a pull request.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/treatwell/rubocop-treatwell.
