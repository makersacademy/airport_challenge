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

Instructions
---------

* Feel free to use google, your notes, books, etc. but work on your own
* If you refer to the solution of another coach or student, please put a link to that in your README
* If you have a partial solution, **still check in a partial solution**
* You must submit a pull request to this repo with your code by 9am Monday morning

Steps
-------

1. Fork this repo, and clone to your local machine
2. Run the command `gem install bundler` (if you don't have bundler already)
3. When the installation completes, run `bundle`
4. Complete the following task:

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
I want to prevent landing when the airport is full 

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate

As an air traffic controller 
To ensure safety 
I want to prevent takeoff when weather is stormy 

As an air traffic controller 
To ensure safety 
I want to prevent landing when weather is stormy 
```

Your task is to test drive the creation of a set of classes/modules to satisfy all the above user stories. You will need to use a random number generator to set the weather (it is normally sunny but on rare occasions it may be stormy). In your tests, you'll need to use a stub to override random weather to ensure consistent test behaviour.

Your code should defend against [edge cases](http://programmers.stackexchange.com/questions/125587/what-are-the-difference-between-an-edge-case-a-corner-case-a-base-case-and-a-b) such as inconsistent states of the system ensuring that planes can only take off from airports they are in; planes that are already flying cannot take off and/or be in an airport; planes that are landed cannot land again and must be in an airport, etc.

For overriding random weather behaviour, please read the documentation to learn how to use test doubles: https://www.relishapp.com/rspec/rspec-mocks/docs . There’s an example of using a test double to test a die that’s relevant to testing random weather in the test.

Please create separate files for every class, module and test suite.

In code review we'll be hoping to see:

* All tests passing
* High [Test coverage](https://github.com/makersacademy/course/blob/main/pills/test_coverage.md) (>95% is good)
* The code is elegant: every class has a clear responsibility, methods are short etc. 

Reviewers will potentially be using this [code review rubric](docs/review.md).  Referring to this rubric in advance will make the challenge somewhat easier.  You should be the judge of how much challenge you want this at this moment.

**BONUS**

* Write an RSpec **feature** test that lands and takes off a number of planes

Note that is a practice 'tech test' of the kinds that employers use to screen developer applicants.  More detailed submission requirements/guidelines are in [CONTRIBUTING.md](CONTRIBUTING.md)

Finally, don’t overcomplicate things. This task isn’t as hard as it may seem at first.

* **Submit a pull request early.**

* Finally, please submit a pull request before Monday at 9am with your solution or partial solution.  However much or little amount of code you wrote please please please submit a pull request before Monday at 9am.


My contributions
-----
Below are my diagrams and notes throughout this challenge. I have referred to the steps in the [Boris Bikes](https://github.com/makersacademy/course/blob/main/boris_bikes/0_challenge_map.md) challenge to support my progress.

Domain Models
-----
User story 1
| Objects | Messages |
|---------|----------|
| Traffic Controller | |
| Airport | |
| Plane | land |

Updated model for user story 1
| Objects | Messages |
|---------|----------|
| Traffic Controller | |
| Airport | instruct |
| Plane | land? |

Feature tests and observations for user story 1
-----
```
➜  airport_challenge git:(main) irb
3.0.2 :001 > plane = Plane.new
(irb):1:in `<main>': uninitialized constant Plane (NameError)
        from /Users/michelle/.rvm/rubies/ruby-3.0.2/lib/ruby/gems/3.0.0/gems/irb-1.3.5/exe/irb:11:in `<top (required)>'
        from /Users/michelle/.rvm/rubies/ruby-3.0.2/bin/irb:23:in `load'
        from /Users/michelle/.rvm/rubies/ruby-3.0.2/bin/irb:23:in `<main>'
```
The type of error above is a `NameError` occuring on line 1 in `irb`. A `NameError`is raised when you reference a constant or a variable which isn't defined in the current context. I will now initalise `rspec` within my project and create a new spec file for my `Plane` object.

Once I created `./spec/plane_spec.rb` to `describe` my `Plane` object, I ran `rspec` which gave me the following error.
```
An error occurred while loading ./spec/plane_spec.rb.
Failure/Error:
  describe Plane do
    
  end

NameError:
  uninitialized constant Plane
# ./spec/plane_spec.rb:1:in `<top (required)>'
No examples found.
```
I will now create a new file for a `Plane` class, inside the `/lib` directory, define a `Plane` class, use `require` to include this file inside my `spec` file and run `rspec` from the Command Line. The unit test passed. I also worked through my original feature test. 
```
➜  airport_challenge git:(main) ✗ irb
3.0.2 :001 > plane = Plane.new
(irb):1:in `<main>': uninitialized constant Plane (NameError)
        from /Users/michelle/.rvm/rubies/ruby-3.0.2/lib/ruby/gems/3.0.0/gems/irb-1.3.5/exe/irb:11:in `<top (required)>'
        from /Users/michelle/.rvm/rubies/ruby-3.0.2/bin/irb:23:in `load'
        from /Users/michelle/.rvm/rubies/ruby-3.0.2/bin/irb:23:in `<main>'
3.0.2 :002 > exit
➜  airport_challenge git:(main) ✗ irb
3.0.2 :001 > require './lib/plane.rb'
 => true 
3.0.2 :002 > plane = Plane.new
 => #<Plane:0x0000000122072f60> 
```
At this point, I realised I needed to refactor my code as I needed an `Airport` class so I could run `airport = Airport.new`, `plane = airport.land`. I renamed `lib/plane.rb` to be `lib/airport.rb` and changed the class to be a type of `Airport`. I also renamed `spec/plane_spec.rb` to be `spec/airport_spec.rb`, where I required the `airport` file from `lib` and referenced `Airport` in the `describe` block.

```
➜  airport_challenge git:(main) irb
3.0.2 :001 > require './lib/airport.rb'
 => true 
3.0.2 :002 > airport = Airport.new
 => #<Airport:0x0000000142034c90> 
3.0.2 :003 > plane = airport.land
(irb):3:in `<main>': undefined method `land' for #<Airport:0x0000000142034c90> (NoMethodError)
        from /Users/michelle/.rvm/rubies/ruby-3.0.2/lib/ruby/gems/3.0.0/gems/irb-1.3.5/exe/irb:11:in `<top (required)>'
        from /Users/michelle/.rvm/rubies/ruby-3.0.2/bin/irb:23:in `load'
        from /Users/michelle/.rvm/rubies/ruby-3.0.2/bin/irb:23:in `<main>'
```
I ran my feature test again, this time creating an instance of the `Airport` class. This was successful. I know this because `#<Airport:0x0000000142034c90>` was returned in `irb`. I then ran `plane = airport.land` as I'm wanting to instruct the plane to land at an airport. The error message I received tells me there is no `land` method. I will now create this using similar steps that I followed to create the `Airport` class.
```
describe Airport do
  it { is_expected.to respond_to :land }
end
```
The above code returned the following error: `Failure/Error: it { is_expected.to respond_to :land }`. This tells me there is still no `land` method. I will now create one within `lib/airport.rb`.
```
class Airport
  def land
  end
end
``` 
The above code from `lib/airport.rb` passes the unit test. 
```
➜  airport_challenge git:(main) ✗ irb
3.0.2 :001 > require './lib/airport.rb'
 => true 
3.0.2 :002 > airport = Airport.new
 => #<Airport:0x0000000126a9d798> 
3.0.2 :003 > plane = airport.land
 => nil 
```
I am also able to create the variable `plane` in `irb` to equal `airport.land` which returns `nil`.
Upon reflection of what to do next, I realised there is another verb in the user story: `instruct`. So I am going to refactor my domain model and code to reflect this. 
```
3.0.2 :001 > require './lib/airport.rb'
3.0.2 :002 > airport = Airport.new
 => #<Airport:0x00000001580b6090> 
3.0.2 :003 > plane = airport.land
(irb):3:in `<main>': undefined method `land' for #<Airport:0x00000001580b6090> (NoMethodError)
        from /Users/michelle/.rvm/rubies/ruby-3.0.2/lib/ruby/gems/3.0.0/gems/irb-1.3.5/exe/irb:11:in `<top (required)>'
        from /Users/michelle/.rvm/rubies/ruby-3.0.2/bin/irb:23:in `load'
        from /Users/michelle/.rvm/rubies/ruby-3.0.2/bin/irb:23:in `<main>'
3.0.2 :004 > plane = airport.instruct
 => nil 
3.0.2 :005 > plane.land?
(irb):5:in `<main>': undefined method `land?' for nil:NilClass (NoMethodError)
        from /Users/michelle/.rvm/rubies/ruby-3.0.2/lib/ruby/gems/3.0.0/gems/irb-1.3.5/exe/irb:11:in `<top (required)>'
        from /Users/michelle/.rvm/rubies/ruby-3.0.2/bin/irb:23:in `load'
        from /Users/michelle/.rvm/rubies/ruby-3.0.2/bin/irb:23:in `<main>'
```
From my new domain model, I'm wanting an `Airport` class to use an `instruct` method on a `plane` where I can run the `land?` method to check if a plane has landed. Using this logic, I ran a new feature test. From the error message, I am being told there is no `land?` method. But I also know, that I haven't created a `Plane` class yet. So I will begin with creating the appropriate files within `lib` and `spec` with the corresponding code for a `Plane` class and `land?` method.  
Once I did this, I ran `rspec` to check my unit tests passed which they did. I also ran my feature test again in `irb`.
```
➜  airport_challenge git:(main) ✗ irb
3.0.2 :001 > require './lib/airport.rb'
 => true 
3.0.2 :002 > airport = Airport.new
 => #<Airport:0x000000012c054a10> 
3.0.2 :003 > plane = airport.instruct
 => nil 
3.0.2 :004 > plane.land?
(irb):4:in `<main>': undefined method `land?' for nil:NilClass (NoMethodError)
        from /Users/michelle/.rvm/rubies/ruby-3.0.2/lib/ruby/gems/3.0.0/gems/irb-1.3.5/exe/irb:11:in `<top (required)>'
        from /Users/michelle/.rvm/rubies/ruby-3.0.2/bin/irb:23:in `load'
        from /Users/michelle/.rvm/rubies/ruby-3.0.2/bin/irb:23:in `<main>'
```
The error I saw was a `NoMethodError` because I am attempting to call a method (`land?`) on `nil` (`plane`).

I added an `it` block to the `airport_spec.rb` file. When I ran `rspec` I got the following error:
```
Failures:

  1) Airport instructs a plane to land
     Failure/Error: expect(plane).to be_landing
       expected nil to respond to `landing?`
```
This tells me that I need the `instruct` method to return something other than `nil`.