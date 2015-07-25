[![Build Status](https://travis-ci.org/christopheralcock/airport_challenge.svg?branch=master)](https://travis-ci.org/christopheralcock/airport_challenge)

Airport Challenge
=================

1. airport must land planes /n
2. airport must launch planes /n 
3. airport must have a capacity /n
4. airport must have a free space method /n
5. airport must count how many planes are there /n
6. landing planes must take up space /n
7. airport must launch specific planes /n
8. launching planes must free up space /n
9. airport must not launch planes that aren't there /n
10. airport must not land planes when full /n
11. airport has weather /n
12. airport must not land planes when stormy /n
13. airport must not launch planes when stormy /n
14. airport's weather should randomise every launch and land - ABORT

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

  describe 'space_check' do
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

5a. irb

heathrow = station.new
heathrow.space_check
nil

5b. rspec

  describe 'space_check' do
    it 'can return its spare space' do
      expect(subject.space_check). to eq Airport::DEFAULT_CAPACITY
    end
  end

5c. Ruby

class Airport
DEFAULT_CAPACITY = 25
attr_reader :capacity

  def initialize
    @capacity = DEFAULT_CAPACITY
    @hanger = []
  end
  def land(plane)
  end

  def launch(plan)
  end

  def space_check
    @capacity - @hanger.length
  end

end

5d. rspec

four greens - modified space check now correct

5e. irb

heathrow = station.new
heathrow.space_check
25

git commit

6a. irb

heathrow = Airport.new
boeing_747 = Plane.new
heathrow.land(boeing_747)
heathrow.space_check
25

6b. rspec

  describe 'space_check' do
    it 'can return its spare space, which is lowered by a plane landing' do
      subject.land(:plane)
      expect(subject.space_check). to eq (Airport::DEFAULT_CAPACITY-1)
    end
  end

fail: expected 24, got 25

6c. Ruby

  def land(plane)
    @hanger << plane
  end

6d. rspec

four greens - modified space check now correct

6e. irb

heathrow = Airport.new
boeing_747 = Plane.new
heathrow.land(boeing_747)
heathrow.space_check
24

git commit

7a. irb

heathrow = Airport.new
boeing_747 = Plane.new
heathrow.land(boeing_747)
heathrow.launch(boeing_747)
error

7b. rspec

  describe 'launch' do
    it 'launches a specific plane' do
      expect(subject).to respond_to(:launch).with(1).argument
    end
  end

*went home. opened up laptop. bit confused, somehow, as to why this test is now passing*
?????

7c. irb

heathrow = Airport.new
boeing_747 = Plane.new
heathrow.land(boeing_747)
heathrow.launch(boeing_747)
nil

8a. irb

heathrow = Airport.new
boeing_747 = Plane.new
heathrow.land(boeing_747)
heathrow.space_check
24
heathrow.launch(boeing_747)
heathrow.space_check
24

8b. rspec

  describe 'space_check' do
    it 'can return its spare space, which is raised by a plane launching' do
      random = rand(100)
      random.times{subject.land(:plane)}
      random.times{subject.launch(:plane)}
      expect(subject.space_check). to eq (Airport::DEFAULT_CAPACITY)
    end
  end

Fail 

8c. ruby

  def launch(plane)
    @hanger.delete(plane) 
  end

8d. rspec

5 greens - space check now correct after a plane leaves

8e.

heathrow = Airport.new
boeing_747 = Plane.new
heathrow.land(boeing_747)
heathrow.space_check
24
heathrow.launch(boeing_747)
heathrow.space_check
25

git commit

9a. irb

heathrow = Airport.new
boeing_747 = Plane.new
heathrow.launch(boeing_747)
nil

9b. rspec

  describe 'launch' do
    it 'raises an error when you try to launch a plane that isn\'t there' do
      @hanger = [:plane1]
      expect { subject.launch(:plane2) }.to raise_error 'That plane isn\'t here'
    end
  end

9c. ruby

  def launch(plane)
      if @hanger.include?(plane)
        @hanger.delete(plane)
      else fail 'That plane isn\'t here'
      end
  end

9d. rspec

  describe 'space_check' do
    it 'can return its spare space, which is raised by a plane launching' do
      subject.land(:plane1)
      subject.land(:plane2)
      subject.launch(:plane1)
      expect(subject.space_check). to eq (Airport::DEFAULT_CAPACITY-1)
    end
  end

had to remove randoms because planes now need to be IDed

9e. irb

heathrow = Airport.new
boeing_747 = Plane.new
heathrow.launch(boeing_747)
error - that plane isn't here

10a. irb

heathrow = Airport.new
boeing_747 = Plane.new
25.times{heathrow.land.boeing_747}
lear_jet = Plane.new
heathrow.land(lear_jet)
all good

10b. rspec

  describe 'land' do
    it 'raises an error when you try to land a plane when there isn\'t room' do
      Airport::DEFAULT_CAPACITY.times{subject.land(:plane)}
      expect { subject.land(:plane) }.to raise_error 'There\'s no room here'
    end
  end

10c. ruby

  def land(plane)
    if @hanger.length < @capacity
      @hanger << plane
    else fail 'There\'s no room here'
    end
  end

 10d. rspec

 seven greeens

10e. irb

heathrow = Airport.new
boeing_747 = Plane.new
25.times{heathrow.land.boeing_747}
lear_jet = Plane.new
heathrow.land(lear_jet)
error - no room

11a. irb

heathrow = Airport.new
heathrow.weather
NoMethod error

11b. rspec

  describe 'weather' do
    it 'has states of weather' do
      expect(subject).to respond_to(:weather)
    end
  end

11c. Ruby

  def initialize
    @capacity = DEFAULT_CAPACITY
    @hanger = []
    @weather
  end

  def weather
    weather_god = rand(100)
    if weather_god <= PERCENTAGE_OF_DAYS_STORMY
      @weather = :stormy
    else @weather = :sunny
    end
  end

11d. spec

pass

11e. irb

heathrow = Airport.new
heathrow.weather
sunny

git commit

12a. irb

heathrow = Airport.new
@weather = :stormy
boeing_747 = Plane.new
heathrow.land(boeing_747)
ok

12b. rspec

  describe 'land' do
    it 'raises an error when you try to land a plane in a storm' do
      subject.instance_variable_set(:@weather, :stormy)
      expect { subject.land(:plane) }.to raise_error 'It\'s too dangerous to land!'
    end
  end

12c. ruby

  def land(plane)
    if @hanger.length >= @capacity && @weather == :stormy
       fail 'There\'s no room here' 'It\'s too dangerous to land!'
    elsif @weather == :stormy
       fail 'It\'s too dangerous to land!'
    elsif @hanger.length >= @capacity
       fail 'There\'s no room here'
    else @hanger << plane
    end
  end

12d. rspec

green

12e. irb

heathrow = Airport.new
heathrow.instance_variable_set(:@weather, :stormy)
boeing_747 = Plane.new
heathrow.land(boeing_747)
ok

13a. irb

heathrow = Airport.new
heathrow.instance_variable_set(:@weather, :stormy)
boeing_747 = Plane.new
heathrow.land(boeing_747)
heathrow.launch(boeing_747)
ok

13b. rspec

  describe 'launch' do
  it 'raises an error when you try to launch a plane in a storm' do
    subject.instance_variable_set(:@weather, :stormy)
    subject.instance_variable_set(:@hanger, [:plane])
    expect { subject.launch(:plane) }.to raise_error 'It\'s too dangerous to launch!'
  end
end

13c. Ruby

  def launch(plane)
    if @hanger.include?(plane) == false
      fail 'That plane isn\'t here'
    elsif @weather == :stormy
      fail 'It\'s too dangerous to launch!'
    else @hanger.delete(plane)
    end
  end

13d. rspec

green

13e. irb

heathrow = Airport.new
heathrow.instance_variable_set(:@weather, :stormy)
boeing_747 = Plane.new
heathrow.land(boeing_747)
heathrow.launch(boeing_747)
error - too dangerous

git commit

14: don't know how i'd feature or unit test this honestly? just going to add a call to self.weather into the launch and lands. understand that this violates SRP but honestly it's an extra line and they're the only thing that marks the passing of time in this model.
My network of tests should keep any cock ups in check tho.

actually this destroys a lot of my tests because the states i'm setting get overwritten, and i don't know how i'd rewrite them. instead it's on the user to simulate time by calling heathrow.weather, which I think is legit.  in a more complicated program there would be the passing of time properly modelled.


Now going to look into refactoring ....




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