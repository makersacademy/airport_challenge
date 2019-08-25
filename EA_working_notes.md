Elsie Ashworth, 24/08/19
Notes made during my work on this project:

airport_challenge README.md:
Steps:
1. Fork this repo, and clone to your local machine
2. Run the command gem install bundle (if you don't have bundle already)
3. When the installation completes, run bundle

After running bundle, it fetched and installed various gems.
Final part of output:
=>
Post-install message from rubocop:
Rails cops will be removed from RuboCop 0.72. Use the `rubocop-rails` gem instead.

Put this in your `Gemfile`.

```rb
gem 'rubocop-rails'
```

And then execute:

```sh
$ bundle install
```

Put this into your `.rubocop.yml`.

```yaml
require: rubocop-rails
```

I edited the above files accordingly.
Further info on rubocop here:
https://rubocop.readthedocs.io/en/latest/cops_bundler/

4. Complete the following task:
See README.md

Questions arising:

What is a module? Research:
  An instance of the Module class
  Contains behaviour, not state.
  Can be included in a class.
  Include in two or more classes that share the same behaviour.
What is a stub?
Read docs re test doubles.
What other edge cases will I test for?

User story 1:

As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport
Objects: ATC, plane(s), airport.
Methods: #initialize, #land_a_plane, #plane_id.
