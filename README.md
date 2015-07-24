https://travis-ci.org/christopheralcock/airport_challenge.svg?branch=master


Airport Challenge
=================

1. airport must land planes /n
2. airport must launch planes /n 
3. airport must have a capacity /n
4. airport must not launch planes when empty /n
airport must not land planes when full /n
airport must not land planes when stormy /n
airport must land planes when it isn't full AND it is sunny /n

1a. irb

heathrow = Airport.new
creates airport!
boeing_747 = Plane.new
creates plane!
heathrow.land(boeing_747)
NoMethod error

1b. rspec

  describe 'land' do
    it 'receives a plane' do
      expect(subject).to respond_to(:land)
    end

Fails!

1c. Ruby

class Airport
  def land(plane)
  end
end

1d. rspec

green - receives a plane

1e. irb

heathrow = Airport.new
creates airport!
boeing_747 = Plane.new
creates plane!
heathrow.land(boeing_747)
nil
I'm not certain this is actually the correct thing to look for, so I try some "wrong" stuff like tring to land lear_jet, which gives an error, which I take as a good sign

2a. irb

heathrow = Airport.new
creates airport!
boeing_747 = Plane.new
creates plane!
heathrow.launch(boeing_747)
NoMethod error

2b. rspec

  describe 'take off' do
    it 'launches a plane' do
      expect(subject).to respond_to(:launch)
    end
  end

 Fails!

2c. Ruby

class Airport
  def land(plane)
  end

  def launch(plane)
  end
end

2d. rspec

two greens - now launches a plane

2e. irb

heathrow = Airport.new
creates airport!
boeing_747 = Plane.new
creates plane!
heathrow.launch(boeing_747)
nil
I reckon this is good now.

git commit

3a. irb

heathrow = Airport.new
heathrow.capacity
NoMethod error

3b. rspec

  describe 'capacity' do
  	it 'has a capacity' do
    	expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  	end
  end

 Fails!

3c. Ruby

DEFAULT_CAPACITY = 25
attr_reader :capacity

def initialize
  @capacity = DEFAULT_CAPACITY
end

3d. rspec

three greens - now has capacity

3e. irb

heathrow = Airport.new
heathrow.capacity
25

git commit

4a. irb

heathrow = Airport.new
heathrow.space_check
error

4b. rspec

  describe 'space' do
    it 'can return its spare space' do
      expect(subject).to respond_to(:space_check)
    end
  end

Fail!

4c. Ruby

  def space_check
  end

4d. rspec

four greens - now responds to space check

4e. irb

heathrow = Airport.new
heathrow.space_check
nil

git commit






















The existing tests in the spec folder, and base classes in the lib folder are provided merely as a general guide.  Please create more classes, unit and/or feature tests as appropriate.  The existing specs provide the layout of a set of pending unit tests. It is up to you to implement the tests and create additional tests as necessary.

For overriding random weather behaviour, please read the documentation to learn how to use test doubles: https://www.relishapp.com/rspec/rspec-mocks/docs . There’s an example of using a test double to test a die that’s relevant to testing random weather in the test.

As mentioned above the existing tests are there just for the inspiration if you need it. You don’t have to implement every single test there and you aren’t limited by the tests there either. Feel free to modify the tests as you see fit.

Please create separate files for every class, module and test suite. 

The submission will be judged on the following criteria:

* Tests pass
* Tests coverage is good
* The code is elegant: every class has a clear responsibility, methods are short etc.
 
BONUS
* Write an RSpec **feature** test that lands and takes off a number of planes...