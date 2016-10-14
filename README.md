# Aws::Ssm::Console

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'aws-ssm-console'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install aws-ssm-console

## Usage

### Configuration

You should configure some environment variables to use AWS SDK.

- `AWS_REGION`
- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`

### Run Command

#### Interactive mode

```
$ aws-ssm-console --instance-ids=i-xxxx,i-yyyy,...
>> 
```

#### Batch mode

```
$ aws-ssm-console -c ls --instance-ids=i-xxxx,i-yyyy,...
...
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/koshigoe/aws-ssm-console.

