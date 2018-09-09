Airport Challenge
=================

```
        ______
        _\____\___
=  = ==(____MA____)
          \_____\___________________,-~~~~~~~`-.._
          /     o o o o o o o o o o o o o o o o  |\_
          `~-.__       __..----..__                  )
                `---~~\___________/------------`````
                =  ===(_________)

```

Steps
-------

1. Clone to your local machine
2. Run the command `gem install bundle` (if you don't have bundle already)
3. When the installation completes, run `bundle install`

Testing
-------

Either use
```
rspec
```
or
```
rspec path/to/file_spec.rb
```

Task
-----

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  Here are the user stories that we worked out in collaboration with the client:

```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport

As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy

As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy

As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```

My task was to test drive the creation of a set of classes/modules to satisfy all the above user stories using TDD. I used a random number generator to set the weather (it is normally sunny but on rare occasions it may be stormy).

A feature test was written for each user story, these can be found listed in order in './user_stories_feature_test.md'. They are written to allow you to copy and paste into irb with the expected result shown in comments.

After each feature test was written unit tests were written to fail in the same way as the feature test, then code was written to fix the test.

In addition to the user stories I also tested for edge cases like the below:

* Planes can only take off from airports they are in
* Planes that are already flying cannot takeoff
* Planes that are landed cannot land again
* Planes that are landed (not flying) cannot land in another airport

An rspec feature test was also written to test multiple planes landing and taking off from multiple airports

## Author

**Patrick Harris** - [TinyGobby](https://github.com/TinyGobby)
