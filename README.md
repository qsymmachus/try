# Try

This is a Ruby implementation of the Scala `Try` monad to enable a more functional style of error handling.

`Success[A]` represents a successful computation wrapping a return value of the type `A`. `Failure[A]` represents an computation
where an error occurred, wrapping an `Exception`. Both `Success[A]` and `Failure[A]` share the same interface, and so while there
is a `Try[A]` duck type, it's not a "real" type (this is Ruby, after all!)

Having a method return `Try[A]` makes it explicit to clients that they are performing a computation that may fail, and gives them
a consistent return type regardless of whether that computation succeeded or failed.

## Installation

Add this line to your application's Gemfile:

```ruby
 gem "try", :git => "git://github.com/qsymmachus/try.git"
```

And then execute:

    $ bundle

## Usage

You may directly instantiate instances of `Success[A]` or `Failure[A]` using their constructors:

```ruby
@success = Success.new("some value")
@failure = Failure.new(Exception.new("whoops!"))
```

*This isn't really idiomatic though* – it requires you to determine in advance whether your computation has
succeeded or failed and handle it in a `begin..rescue` block, which defeats the whole point!

Instead, you can perform your computation in a block that you pass to the method `try`:

```ruby
@result = try { some_computation }
# => Success if some_computation succeeded
# => Failure if some_computation raised an error
```

Once you have your result, it shares a common interface regardless of whether it succeeded or failed:

```ruby
@result = try { some_computation }

@result.get
# => returns the wrapped value if it's a Success
# => raises the wrapped error if it's a Failure

@result.get_or_else(alternate)
# => returns the wrapped value if it's a Success
# => returns the alternate value if it's a Failure

@result.is_success?
# => returns true if it's a Success
# => returns false if it's a Failure

@result.map { |result| result.optimize }
# => returns a Success wrapping the "optimized" result if it's a Success
# => returns a Failure wrapping the original error if it's a Failure
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/qsymmachus/try


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
