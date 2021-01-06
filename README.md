# MicroManager

This gems is aimed at improving productivity by allowing to create quick TO-DO tasks from the terminal.
The name is a pun on [micro-management](https://en.wikipedia.org/wiki/Micromanagement) and it's usage is also inspired on
a word they usually say a lot "Just do this feature, it should be easy", "Oh, it's just a text change. It shouldn't take long"

## Installation

Install it as:

    $ gem install micro_manager

## Usage

MicroManager adds a `just` command, which can be used to add tasks like:

```bash
$ just Add what you want to do --due 1-week # you can also use a date or leave it blank to default to today
```

List tasks

```bash
$ just --list-tasks # or -l
```

And finally complete tasks:

```bash
$ just --complete-task
```

For more detail run `just --help`

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/brunvez/micro_manager.
