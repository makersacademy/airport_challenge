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
Re-write tests using one-liner syntax once I understand what they do.

When I changed into the airport_challenge directory, I saw this message:
Required ruby-2.6.0 is not installed.
To install do: 'rvm install "ruby-2.6.0"'
So I ran the above command to install ruby 2.6.0.

User story 1:

As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport
Objects: ATC, plane, airport.
Method: #land_a_plane

Domain model:
Airport <-- land_a_plane --> a Plane.

User story 2:
As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport
and confirm that it is no longer in the airport
Objects: ATC, plane, airport.
Methods: #plane_take_off
Domain model:
Airport <-- plane_take_off --> a Plane.

Edge cases provided:
Your code should defend against edge cases
such as inconsistent states of the system ensuring that
planes can only take off from airports they are in;
planes that are already flying cannot take off and/or be in an airport;
planes that are landed cannot land again and must be in an airport, etc.

My notes about cases:
Need to confirm that plane is not on "landed" list unless it has landed.
Need to add plane to the "landed" list as it lands.
Need to confirm that plane is on "landed" list if it has landed.
Plane cannot land if it is already on landed list.
Need to confirm that plane is on the landed list before it can take off.
Need to remove plane from the landed list as it takes off.
