# Progress on the Airport Challenge.
## User Story 1:  

> As an air traffic controller.    
> So I can get passengers to a destination.  
> I want to instruct a plane to land at an airport.   

### Doman model:  
  Objects  | Messages.  
  ------------- | -------------
  Traffic controller |   
  Plane  |   land?.
  Airport | land_plane.

> Plane <— land —>  true/false.
> Airport  <— land _plane—> a Plane.    

### Feature Test:
To  run feature test using irb in terminal

```
➜  airport_challenge git:(master) ✗ irb
```

```
2.5.0 :001 > plane = Plane.new
Traceback (most recent call last):
        2: from /Users/simonyi/.rvm/rubies/ruby-2.5.0/bin/irb:11:in `<main>'
        1: from (irb):1
NameError (uninitialized constant Plane)
2.5.0 :002 >
```

### Unit Test:
create a new file spec/plane_spec.rb.   

```
require 'plane'

describe Plane do
  subject { described_class.new }
  it {is_expected.to be_an_instance_of Plane}
end
```

### Code to pass the Unit Test:
create a new file lib/plane.rb.

```
class Plane
end
```

Run unit test using rspec.    

```
➜  airport_challenge git:(master) ✗ rspec
```

### Feature Test after Unit Test:
* Pass the feature test on Plane.new.
* Fail the feature test on plane.land.

```
2.5.0 :001 > require "./lib/plane.rb"
 => true
2.5.0 :002 > plane = Plane.new
 => #<Plane:0x00007fd3e61d9568>
2.5.0 :003 > plane.land
Traceback (most recent call last):
        2: from /Users/simonyi/.rvm/rubies/ruby-2.5.0/bin/irb:11:in `<main>'
        1: from (irb):3
NoMethodError (undefined method `land' for #<Plane:0x00007fd3e61d9568>)
2.5.0 :004 >
```


### Unit Test for the failed Feature Test.
Add the test for the method plane.land.    

```
  describe '#land' do
    it { expect(subject.land).to eq true}
  end
```

### Code to pass the Unit Test:    

```
class Plane
  def land?
    true
  end
end
```

### Feature Test after Unit Test:    
• pass the feature test for plan.land.

```
2.5.0 :001 > require "./lib/plane.rb"
 => true
2.5.0 :002 > plane = Plane.new
 => #<Plane:0x00007fa27a0d9318>
2.5.0 :003 > plane.land?
 => true
2.5.0 :004 >
```

• Fail the feature test for Airport.new.  

```
2.5.0 :001 > airport = Airport.new
Traceback (most recent call last):
        2: from /Users/simonyi/.rvm/rubies/ruby-2.5.0/bin/irb:11:in `<main>'
        1: from (irb):1
NameError (uninitialized constant Airport)
2.5.0 :002 >
```

### Unit test for Airport class.

```
require 'airport'

describe Airport do
  subject { described_class.new }
  it {is_expected.to be_an_instance_of Airport}
end
```

### Code to pass the Unit Test:
create a lib/airport.rb file.  

```
class Airport
end
```

### Feature Test after Unit Test:    
• pass the feature test for Airport.new.
• fail the feature for airport.land.

```
2.5.0 :001 > require "./lib/airport.rb"
 => true
2.5.0 :002 > airport = Airport.new
 => #<Airport:0x00007fee24990970>
2.5.0 :003 > airport.land(plane)
Traceback (most recent call last):
        2: from /Users/simonyi/.rvm/rubies/ruby-2.5.0/bin/irb:11:in `<main>'
        1: from (irb):3
NameError (undefined local variable or method `plane' for main:Object)
2.5.0 :004 > plane = Plane.new
Traceback (most recent call last):
        2: from /Users/simonyi/.rvm/rubies/ruby-2.5.0/bin/irb:11:in `<main>'
        1: from (irb):4
NameError (uninitialized constant Plane)
```

### Unit Test for airport.land(plane)
redandent.  
```
it { is_expected.to be_an_instance_of Airport }
```

Update:  
```
require 'airport'

describe Airport do
  subject { described_class.new }
  let(:plane) { Plane.new }

  describe '#land' do
    it { expect(subject.land(:plane)).to eq :plane }
  end

end
```

### Code to pass the unit test.
```
class Airport
  def land(plane)
    @plane = plane
  end
end
```

### Feature Test after Unit Test:  
* pass the feature test for user story 1.

```
2.5.0 :001 > require './lib/airport.rb'
 => true
2.5.0 :002 > require './lib/plane.rb'
 => true
2.5.0 :003 > plane = Plane.new
 => #<Plane:0x00007fb587878400>
2.5.0 :004 > airport = Airport.new
 => #<Airport:0x00007fb5878704a8>
2.5.0 :005 > Airport.land(plane)
Traceback (most recent call last):
        2: from /Users/simonyi/.rvm/rubies/ruby-2.5.0/bin/irb:11:in `<main>'
        1: from (irb):5
NoMethodError (_undefined method `land' for Airport:Class_)
2.5.0 :006 > airport.land(plane)
 => #<Plane:0x00007fb587878400>
2.5.0 :007 >
```

### Refactor the Unit Test
* redundant  tests on the Plane.new.
* use double : plane  in airport_spec.

```
require 'plane'

describe Plane do
  subject { described_class.new }

  describe '#land?' do
    it { expect(subject.land?).to eq true }
  end
end
```

```
require 'airport'

describe Airport do
  subject { described_class.new }
  let(:plane) { double(:plane) }

  describe '#land' do
    it { expect(subject.land(:plane)).to eq :plane }
  end

end
```

* Pass the unit tests and feature tests.  

### Git commit  
In terminal
```
git status
git add .
git commit -m "message"
```


## User Story 2
> As an air traffic controller.
> So I can get passengers on the way to their destination.
> I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport.

### Doman model:  
  Objects  | Messages.  
  ------------- | -------------
  Traffic controller |   
  Plane  |   taken_off?.
  Airport | take_off_plane.

> Plane <— taken_off? —>  true/false.
> Airport  <— take_off —> a Plane.  

### Feature test.
* fail the feature test on plane.taken_off?
```
2.5.0 :006 > plane
 => #<Plane:0x00007fb2c7917f40>
2.5.0 :007 > plane.taken_off?
Traceback (most recent call last):
        2: from /Users/simonyi/.rvm/rubies/ruby-2.5.0/bin/irb:11:in `<main>'
        1: from (irb):7
NoMethodError (_undefined method `taken_off?' for #<Plane:0x00007fb2c7917f40>_)
2.5.0 :008 >
```

### Unit test on plane.taken_off?
* Update the test with before do blog

```
require 'plane'

describe Plane do
  before :each do
    subject { described_class.new }
  end

  describe '#land?' do
    it { expect(subject.land?).to eq true }
  end

  describe '#taken_off?' do
    it "confirm the airplane status as taken off " do
      subject.taken_off?
      expect(subject.taken_off). to eq true
    end
  end
end
```

### Code to pass the unit test.

```
class Plane
  attr_reader :taken_off

  def land?
    true
  end

  def taken_off?
    @taken_off = true
  end

end
```   


### Feature Test
* Pass the feature test for plane taken off.
* fail the feature test for airport take off  plane.

```
2.5.0 :001 > require './lib/plane.rb'
 => true
2.5.0 :002 > plane = Plane.new
 => #<Plane:0x00007f8e0d11c1a8>
2.5.0 :003 > plane.taken_off?
 => true
2.5.0 :004 > plane.taken_off
 => true
2.5.0 :005 > require './lib/airport.rb'
 => true
2.5.0 :006 > plane1 = Plane.new
 => #<Plane:0x00007f8e0d1054f8>
2.5.0 :007 > airport = Airport.new
 => #<Airport:0x00007f8e0d09d6a0>
2.5.0 :008 > airport.land(plane1)
 => #<Plane:0x00007f8e0d1054f8>
2.5.0 :009 > airport.take_off
Traceback (most recent call last):
        2: from /Users/simonyi/.rvm/rubies/ruby-2.5.0/bin/irb:11:in `<main>'
        1: from (irb):9
NoMethodError (undefined method `take_off' for #<Airport:0x00007f8e0d09d6a0 @plane=#<Plane:0x00007f8e0d1054f8>>)
2.5.0 :010 >
```


### Unit Test for the failed feature test.

```
  describe '#take_off' do
    let(:plane) { double :plane }

    it 'take off a plane' do
      allow(plane).to receive(:taken_off?).and_return(true)
      subject.land(plane)
      taken_off_plane = subject.take_off
      expect(taken_off_plane.taken_off?).to eq true
    end
  end
```

### Code to pass the unit test.  

```
  def take_off
    plane.taken_off?
    plane
  end
```

### Feature test.  

```
2.5.0 :001 > require './lib/airport.rb'
 => true
2.5.0 :002 > airport = Airport.new
 => #<Airport:0x00007fe1628addd8>
2.5.0 :003 > plane = Plane.new
 => #<Plane:0x00007fe1628a60d8>
2.5.0 :004 > airport.land(plane)
 => #<Plane:0x00007fe1628a60d8>
2.5.0 :005 > airport.take_off
 => #<Plane:0x00007fe1628a60d8 @taken_off=true>
2.5.0 :006 >
```

## User Story 3
> As an air traffic controller.  
> To ensure safety.    
> I want to prevent takeoff when weather is stormy.

### Doman model:  
  Objects  | Messages.  
  ------------- | -------------
  Traffic controller |   
  Weather |  is_stormy?
  Airport  |   prevent_takeoff_when_stormy

> Weather <— is_stormy? —>  true/false.
> Airport  <— prevent_takeoff—> a Plane.    

###  Feature test for Weather.  

```
2.5.0 :001 > weather = Weather.new
Traceback (most recent call last):
        2: from /Users/simonyi/.rvm/rubies/ruby-2.5.0/bin/irb:11:in `<main>'
        1: from (irb):1
NameError (uninitialized constant Weather)
2.5.0 :002 >
```

### Unit Test.
create a lib/weather_spec.rb file.

```
require 'weather'

describe Weather do
  before :each do
    subject { described_class.new }
  end

  describe '#is_stormy?' do
    it "check the weather being stormy " do
      subject.is_stormy?
      expect(subject.stormy). to eq true
    end
  end
end
```

### Code to pass the unit test.
create a lib/weather.rb file.  

```
class Weather
  attr_reader :stormy

  def stormy?
    @stormy = true
  end

end
```


### Feature Test.    

* pass the feature test for weather stormy.  
```
2.5.0 :001 > require './lib/weather'
 => true
2.5.0 :002 > weather = Weather.new
 => #<Weather:0x00007fae8a134e90>
2.5.0 :003 > weather.stormy?
 => true
2.5.0 :004 > weather.stormy
 => true
2.5.0 :005 > weather
 => #<Weather:0x00007fae8a134e90 @stormy=true>
2.5.0 :006 >
```

* Fail the feature test which supposed to raise an error as weather is stormy.
```
2.5.0 :006 > require "./lib/airport"
 => true
2.5.0 :007 > airport = Airport.new
 => #<Airport:0x00007fae8a115428>
2.5.0 :008 > plane = Plane.new
 => #<Plane:0x00007fae8a1116e8>
2.5.0 :009 > airport.land(plane)
 => #<Plane:0x00007fae8a1116e8>
2.5.0 :010 > airport.take_off
 => #<Plane:0x00007fae8a1116e8 @taken_off=true>
2.5.0 :011 >
```

### Unit Tests

* Use Stub and Mock.  
* extra the repeatedly assignment to ‘before do’   

```
require 'airport'

describe Airport do

  before(:each) do
    @weather = double :weather
    @subject = described_class.new(weather)
    @plane = double :plane
  end

  context "when is not stormy:" do
    attr_reader :weather, :subject, :plane

    describe '#land' do
      it 'land a plane' do
        expect(subject.land(plane)).to eq plane
      end
    end

    describe '#take_off' do

      it 'take off a plane' do
        allow(weather).to receive(:stormy).and_return(false)
        allow(plane).to receive(:taken_off?).and_return(true)
        subject.land(plane)
        taken_off_plane = subject.take_off
        expect(taken_off_plane.taken_off?).to eq true
      end
    end
  end

  context "when stormy:" do
    attr_reader :weather, :subject, :plane

    describe '#take_off' do
      it "prevent takeoff" do
        allow(weather).to receive(:stormy).and_return(true)
        expect { subject.take_off }.to raise_error "it is stormy"
      end
    end
  end

end
```

### Code to pass unit test.

```
require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :plane, :weather

  def initialize(weather)
    @weather = weather
  end

  def land(plane)
    @plane = plane
  end

  def take_off
    raise "it is stormy" if weather.stormy

    plane.taken_off?
    plane
  end
end
```



### Feature Test

* Pass the minimum requirement for feature test.

```
2.5.0 :001 > require "./lib/airport"
 => true
2.5.0 :002 > weather = Weather.new
 => #<Weather:0x00007fe3c8060ac8>
2.5.0 :003 > plane = Plane.new
 => #<Plane:0x00007fe3c8058d50>
2.5.0 :004 > airport = Airport.new(weather)
 => #<Airport:0x00007fe3c80500b0 @weather=#<Weather:0x00007fe3c8060ac8>>
2.5.0 :005 > airport.land(plane)
 => #<Plane:0x00007fe3c8058d50>
2.5.0 :006 > weather.stormy?
 => true
2.5.0 :007 > airport
 => #<Airport:0x00007fe3c80500b0 @weather=#<Weather:0x00007fe3c8060ac8 @stormy=true>, @plane=#<Plane:0x00007fe3c8058d50>>
2.5.0 :008 > airport.take_off
Traceback (most recent call last):
        3: from /Users/simonyi/.rvm/rubies/ruby-2.5.0/bin/irb:11:in `<main>'
        2: from (irb):8
        1: from /Users/simonyi/Projects/airport_challenge/lib/airport.rb:16:in `take_off'
RuntimeError (it is stormy)
2.5.0 :009 >
```

### Additional Feature
* Generate the weather randomly.  

```
2.5.0 :001 > require './lib/weather.rb'
 => true
2.5.0 :002 > weather = Weather.new
 => #<Weather:0x00007f7fd4877458>
2.5.0 :003 > weather.stormy?
 => true
2.5.0 :004 > weather.stormy?
 => true
2.5.0 :005 > weather.stormy?
 => true
2.5.0 :006 > weather.stormy?
 => true
2.5.0 :007 > weather.stormy?
 => true
2.5.0 :008 >
```

Expected to have both true and false ; Update the unit tests to be:  

```
  describe '#stormy?' do
    it "check the weather being stormy " do
      allow(subject).to receive(:rand).and_return(2)
      expect(subject.stormy?). to eq true
    end

    it "check the weather being stormy " do
      allow(subject).to receive(:rand).and_return(5)
      expect(subject.stormy?). to eq false
    end
  end
```

Pass the tests with code:

```
class Weather
  attr_reader :stormy

  def stormy?
    rand(1..10) <= RATEOUTOFTEN
  end

  RATEOUTOFTEN = 3
  private_constant :RATEOUTOFTEN

end
```

Pass the Feature Test.

```
➜  airport_challenge git:(master) ✗ irb
2.5.0 :001 > require './lib/weather.rb'
 => true
2.5.0 :002 > weather = Weather.new
 => #<Weather:0x00007feb61937138>
2.5.0 :003 > weather.stormy?
 => false
2.5.0 :004 > weather.stormy?
 => false
2.5.0 :005 > weather.stormy?
 => false
2.5.0 :006 > weather.stormy?
 => true
2.5.0 :007 > weather.stormy?
 => true
2.5.0 :008 > weather.stormy?
 => true
2.5.0 :009 > weather.stormy?
 => true
2.5.0 :010 > weather.stormy?
 => true
2.5.0 :011 > weather.stormy?
 => false
2.5.0 :012 > weather.stormy?
 => false
2.5.0 :013 >
```

### Refactor.  
Weather condition is self-generated could redundant weather. stormy but keep weather.stormy? Update the code and tests accordingly.   

### Git commit.  
Update Progress.md and git commit.


## User Story 4
> As an air traffic controller.  
> To ensure safety.
> I want to prevent landing when weather is stormy.

### Doman model:  
  Objects  | Messages.  
  ------------- | -------------
  Traffic controller |   
  Weather |  is_stormy?
  Airport  |   prevent_land_when_stormy

> Weather <— is_stormy? —>  true/false.
> Airport  <— prevent_land—> a Plane.  

### Feature Test
‘stormy?’ is an exciting feature, so new feature to be developed is ‘prevent_land’

* expect to raise an error
```
2.5.0 :001 > require './lib/airport.rb'
 => true
2.5.0 :002 > weather = Weather.new
 => #<Weather:0x00007fa1fc8fd568>
2.5.0 :003 > weather.stormy?
 => false
2.5.0 :004 > airport = Airport.new(weather)
 => #<Airport:0x00007fa1fc8f5840 @weather=#<Weather:0x00007fa1fc8fd568>>
2.5.0 :005 > plane = Plane.new
 => #<Plane:0x00007fa1fc8edb18>
2.5.0 :006 > airport.land(plane)
 => #<Plane:0x00007fa1fc8edb18>
2.5.0 :007 >
```

### Unit tests.  
Update the unit tests:
```
context "when is not stormy:" do
#some other code

describe '#land' do
      it 'land a plane' do
        allow(weather).to receive(:stormy?).and_return(false)
        expect(subject.land(plane)).to eq plane
      end
    end

#some other code

 context "when stormy:" do
#some other code

    describe '#land' do
      it "prevent land" do
        allow(weather).to receive(:stormy?).and_return(true)
        expect { subject.land(plane) }.to raise_error "it is stormy"
      end
    end

#some other code

```

### code to pass the test.
In the land method:

```
  def land(plane)
    raise "it is stormy" if weather.stormy?

    @plane = plane
  end
```

### Feature test
Pass the feature test.  

```
2.5.0 :001 > require './lib/airport.rb'
 => true
2.5.0 :002 > weather = Weather.new
 => #<Weather:0x00007ffd9ea44540>
2.5.0 :003 > airport = Airport.new(weather)
 => #<Airport:0x00007ffd9ea2f870 @weather=#<Weather:0x00007ffd9ea44540>>
2.5.0 :004 > plane = Plane.new
 => #<Plane:0x00007ffd9ea37b60>
2.5.0 :005 > airport.land(plane)
 => #<Plane:0x00007ffd9ea37b60>
2.5.0 :006 > airport.land(plane)
 => #<Plane:0x00007ffd9ea37b60>
2.5.0 :007 > airport.land(plane)
Traceback (most recent call last):
        3: from /Users/simonyi/.rvm/rubies/ruby-2.5.0/bin/irb:11:in `<main>'
        2: from (irb):7
        1: from /Users/simonyi/Projects/airport_challenge/lib/airport.rb:12:in `land'
RuntimeError (it is stormy)
2.5.0 :008 >
```

## User Story 5
> As an air traffic controller
> To ensure safety
> I want to prevent landing when the airport is full

### Doman model:  
  Objects  | Messages.  
  ------------- | -------------
  Traffic controller |   
   airport |  full?
  Airport  |   prevent_landing_when_full

> airport <— full? —>  true —>prevent_landing
> 				—>  false

### Feature test.

```
2.5.0 :001 > require './lib/airport.rb'
 => true
2.5.0 :002 > weather = Weather.new
 => #<Weather:0x00007fb9c30ccb08>
2.5.0 :003 > airport = Airport.new(weather)
 => #<Airport:0x00007fb9c30bfe30 @weather=#<Weather:0x00007fb9c30ccb08>>
2.5.0 :004 > plane = Plane.new
 => #<Plane:0x00007fb9c30bc0c8>
2.5.0 :005 > airport.land(plane)
 => #<Plane:0x00007fb9c30bc0c8>
2.5.0 :006 > airport.full?
Traceback (most recent call last):
        2: from /Users/simonyi/.rvm/rubies/ruby-2.5.0/bin/irb:11:in `<main>'
        1: from (irb):6
NoMethodError (undefined method `full?' for #<Airport:0x00007fb9c30bfe30>)
2.5.0 :007 >
```

### Unit test.
* full? Indicates capacity, so need use airport _apron（array） to store plane when landing and release plane when takeoff.
* full? also indicate maximum capacity.

Update the tests to reflect the use of array (airport_apron):
* push the landing plane to the airport_apron array.
* shift the airport_apron array to takeoff.  

```
before(:each) do
    @weather = double :weather
    @subject = described_class.new(weather)
    @plane = double :plane
    @plane2 = double :plane
    @plane3 = double :plane
  end

  context "when is not stormy:" do
    attr_reader :weather, :subject, :plane, :plane2, :plane3

    describe '#land' do
      it 'land a plane' do
        allow(weather).to receive(:stormy?).and_return(false)
        [plane, plane2, plane3].map { |p| subject.land(p) }
        expect(subject.airport_apron.last).to eq plane3
      end
    end

    describe '#take_off' do

      it 'take off a plane' do
        allow(weather).to receive(:stormy?).and_return(false)
        allow(plane).to receive(:taken_off?).and_return(true)
        [plane, plane2, plane3].map { |p| subject.land(p) }
        taking_off_plane = subject.take_off
        expect(taking_off_plane.taken_off?).to eq true
      end

      it 'take off the frist plane' do
        allow(weather).to receive(:stormy?).and_return(false)
        allow(plane).to receive(:taken_off?).and_return(true)
        [plane, plane2, plane3].map { |p| subject.land(p) }
        expect(subject.take_off).to eq plane
      end

      it 'update the airport_apron stock' do
        allow(weather).to receive(:stormy?).and_return(false)
        allow(plane).to receive(:taken_off?).and_return(true)
        [plane, plane2, plane3].map { |p| subject.land(p) }
        subject.take_off
        expect(subject.airport_apron.size).to eq 2
      end
    end
  end
```

### Update code to pass unit tests.  
```
class Airport
  attr_reader :plane, :weather, :airport_apron

  def initialize(weather)
    @weather = weather
    @airport_apron = []
  end

  def land(plane)
    raise "it is stormy" if weather.stormy?

    airport_apron << plane
  end

  def take_off
    raise "it is stormy" if weather.stormy?

    taking_off_plane = airport_apron.shift
    taking_off_plane.taken_off?
    taking_off_plane
  end
end
```


### Commit the updates.  
Use array to store the landed planes.


### Unit tests for capacity.  
Expect to raise error when airport apron is full.  

```
    it 'allow to land when airport_apron is not full' do
      allow(weather).to receive(:stormy?).and_return(false)
      (described_class::DEFAULT_CAPACITY - 1).times { subject.land(double :plane) }
      subject.land(plane)
      expect(subject.airport_apron.last).to eq plane
    end

    it 'rasie error if try to land when airport_apron is full' do
      allow(weather).to receive(:stormy?).and_return(false)
      described_class::DEFAULT_CAPACITY.times { subject.land(double :plane) }
      expect { subject.land(double :plane) }.to raise_error "airport apron is full"
    end
```

Edge case tested.  

### Code to pass the unit tests.  
In airport.rb:
```
  DEFAULT_CAPACITY = 20

  def initialize(weather)
    @weather = weather
    @airport_apron = []
  end

  def land(plane)
    raise "it is stormy" if weather.stormy?

    raise "airport apron is full" if airport_apron.size >= DEFAULT_CAPACITY

    airport_apron << plane
  end
```

## Feature test.
Pass the feature test:  
DEFAULT_CAPACITY is set to 3 to make the demo of feature tests shorter.   

```
2.5.0 :001 > require './lib/airport.rb'
 => true
2.5.0 :002 > weather = Weather.new
 => #<Weather:0x00007fb8111c4c30>
2.5.0 :003 > airport = Airport.new(weather)
 => #<Airport:0x00007fb8111b7fa8 @weather=#<Weather:0x00007fb8111c4c30>, @airport_apron=[]>
2.5.0 :004 > airport.land(Plane.new)
 => [#<Plane:0x00007fb8111afbc8>]
2.5.0 :005 > airport.land(Plane.new)
 => [#<Plane:0x00007fb8111afbc8>, #<Plane:0x00007fb8111a7a18>]
2.5.0 :006 > airport.land(Plane.new)
Traceback (most recent call last):
        3: from /Users/simonyi/.rvm/rubies/ruby-2.5.0/bin/irb:11:in `<main>'
        2: from (irb):6
        1: from /Users/simonyi/Projects/airport_challenge/lib/airport.rb:15:in `land'
RuntimeError (it is stormy)
2.5.0 :007 > airport.land(Plane.new)
 => [#<Plane:0x00007fb8111afbc8>, #<Plane:0x00007fb8111a7a18>, #<Plane:0x00007fb8111853a0>]
2.5.0 :008 > airport.land(Plane.new)
Traceback (most recent call last):
        3: from /Users/simonyi/.rvm/rubies/ruby-2.5.0/bin/irb:11:in `<main>'
        2: from (irb):8
        1: from /Users/simonyi/Projects/airport_challenge/lib/airport.rb:17:in `land'
RuntimeError (airport apron is full)
2.5.0 :009 > airport.land(Plane.new)
Traceback (most recent call last):
        3: from /Users/simonyi/.rvm/rubies/ruby-2.5.0/bin/irb:11:in `<main>'
        2: from (irb):9
        1: from /Users/simonyi/Projects/airport_challenge/lib/airport.rb:17:in `land'
RuntimeError (airport apron is full)
2.5.0 :010 >
```

### Commit the updates
Prevent land when airport ( airport_ apron is full)


User Story 6
> As the system designer
> So that the software can be used for many different airports
> I would like a default airport capacity that can be overridden as appropriate

### Doman model:  
  Objects  | Messages.  
  ------------- | -------------
  Traffic controller |   
  default_airport_capacity  |   be_overridden.

> default_airport_capacity  < be_overridden

Set airport capacity

### Feature test.

```
2.5.0 :001 > require './lib/airport.rb'
 => true
2.5.0 :002 > weather = Weather.new
 => #<Weather:0x00007fc7d7a14cc0>
2.5.0 :003 > airport = Airport.new(weather,5)
Traceback (most recent call last):
        4: from /Users/simonyi/.rvm/rubies/ruby-2.5.0/bin/irb:11:in `<main>'
        3: from (irb):3
        2: from (irb):3:in `new'
        1: from /Users/simonyi/Projects/airport_challenge/lib/airport.rb:9:in `initialize'
ArgumentError (wrong number of arguments (given 2, expected 1))
2.5.0 :004 >
```

### Unit tests.

```
      it 'allow to land when the reset capcity is not met yet' do
        allow(weather).to receive(:stormy?).and_return(false)
        capcity = rand(5..10)
        subject = described_class.new(weather, capcity)
        (capcity - 1).times { subject.land(double :plane) }
        subject.land(plane)
        expect(subject.airport_apron.last).to eq plane
      end

      it 'rasie error if try to land when is over the reset airport capacity' do
        allow(weather).to receive(:stormy?).and_return(false)
        capcity = rand(5..10)
        subject = described_class.new(weather, capcity)
        capcity.times { subject.land(double :plane) }
        expect { subject.land(double :plane) }.to raise_error "airport apron is full"
      end
```

### Code to pass the unit tests.

```
class Airport
  attr_reader :plane, :weather, :airport_apron, :capcity

  DEFAULT_CAPACITY = 20

  def initialize(weather, capcity = DEFAULT_CAPACITY)
    @weather = weather
    @airport_apron = []
    @capcity = capcity
  end

  def land(plane)
    raise "it is stormy" if weather.stormy?

    raise "airport apron is full" if airport_apron.size >= capcity

    airport_apron << plane
  end

  def take_off
    raise "it is stormy" if weather.stormy?

    taking_off_plane = airport_apron.shift
    taking_off_plane.taken_off?
    taking_off_plane
  end
end
```

### Feature Test.  
Pass the feature test of set capacity:  

```
2.5.0 :001 > require './lib/airport.rb'
 => true
2.5.0 :002 > weather = Weather.new
 => #<Weather:0x00007fc696914a10>
2.5.0 :003 > airport = Airport.new(weather,2)
 => #<Airport:0x00007fc69691f640 @weather=#<Weather:0x00007fc696914a10>, @airport_apron=[], @capcity=2>
2.5.0 :004 > airport.land(Plane.new)
 => [#<Plane:0x00007fc69690f1f0>]
2.5.0 :005 > airport.land(Plane.new)
Traceback (most recent call last):
        3: from /Users/simonyi/.rvm/rubies/ruby-2.5.0/bin/irb:11:in `<main>'
        2: from (irb):5
        1: from /Users/simonyi/Projects/airport_challenge/lib/airport.rb:16:in `land'
RuntimeError (it is stormy)
2.5.0 :006 > airport.land(Plane.new)
 => [#<Plane:0x00007fc69690f1f0>, #<Plane:0x00007fc6969014d8>]
2.5.0 :007 > airport.land(Plane.new)
Traceback (most recent call last):
        3: from /Users/simonyi/.rvm/rubies/ruby-2.5.0/bin/irb:11:in `<main>'
        2: from (irb):7
        1: from /Users/simonyi/Projects/airport_challenge/lib/airport.rb:18:in `land'
RuntimeError (airport apron is full)
2.5.0 :008 > airport
 => #<Airport:0x00007fc69691f640 @weather=#<Weather:0x00007fc696914a10>, @airport_apron=[#<Plane:0x00007fc69690f1f0>, #<Plane:0x00007fc6969014d8>], @capcity=2>
2.5.0 :009 > airport.take_off
Traceback (most recent call last):
        3: from /Users/simonyi/.rvm/rubies/ruby-2.5.0/bin/irb:11:in `<main>'
        2: from (irb):9
        1: from /Users/simonyi/Projects/airport_challenge/lib/airport.rb:24:in `take_off'
RuntimeError (it is stormy)
2.5.0 :010 > airport.take_off
 => #<Plane:0x00007fc69690f1f0 @taken_off=true>
2.5.0 :011 > airport
 => #<Airport:0x00007fc69691f640 @weather=#<Weather:0x00007fc696914a10>, @airport_apron=[#<Plane:0x00007fc6969014d8>], @capcity=2>
2.5.0 :012 > airport.land(Plane.new)
 => [#<Plane:0x00007fc6969014d8>, #<Plane:0x00007fc69687c008>]
2.5.0 :013 >
```

## Revisit and Reactor
### plane.land?
Currently, ‘plane, land?’ Is a ‘ setter’ and will set the return value as  ’true’,  whenever calling the method. To make this function useful. A variable will be need  store the ‘landed’ status and use a ‘getter’ to read the value when necessary,

#### feature test    

```
2.5.0 :001 > require "./lib/plane.rb"
 => true
2.5.0 :002 > plan = Plane.new
 => #<Plane:0x00007fb9a8866e10>
2.5.0 :003 > plan.land?
 => true
2.5.0 :004 > plan.landed
Traceback (most recent call last):
        2: from /Users/simonyi/.rvm/rubies/ruby-2.5.0/bin/irb:11:in `<main>'
        1: from (irb):4
NoMethodError (undefined method `landed' for #<Plane:0x00007fb9a8866e10>
Did you mean?  land?)
2.5.0 :005 >
```

#### update unit tests.   

```
class Plane
  attr_reader :taken_off, :landed

  def land?
    @landed = true
  end

  def taken_off?
    @taken_off = true
  end

end
```

#### update code.   
```
class Plane
  attr_reader :taken_off, :landed

  def land?
    @landed = true
  end

  def taken_off?
    @taken_off = true
  end

end
```

#### pass the feature test.       

```
2.5.0 :001 > require "./lib/plane.rb"
 => true
2.5.0 :002 > plane = Plane.new
 => #<Plane:0x00007fbf2787af30>
2.5.0 :003 > plane.land?
 => true
2.5.0 :004 > plane.landed
 => true
2.5.0 :005 > plane
 => #<Plane:0x00007fbf2787af30 @landed=true>
2.5.0 :006 >
```


### airport.land(plane) to change the airplane ‘landed’ too true.
We can invoking the  plane.land? With in the airplane.land(plan).  

#### feature test.
Expected the plane to have  @landed. = true.
```
2.5.0 :001 > require './lib/airport.rb'
 => true
2.5.0 :002 > plane = Plane.new
 => #<Plane:0x00007fb3bb1f4b88>
2.5.0 :003 > weather = Weather.new
 => #<Weather:0x00007fb3bb1ccb88>
2.5.0 :004 > airport = Airport.new(weather,3)
 => #<Airport:0x00007fb3bb1cb760 @weather=#<Weather:0x00007fb3bb1ccb88>, @airport_apron=[], @capcity=3>
2.5.0 :005 > airport.land(plane)
Traceback (most recent call last):
        3: from /Users/simonyi/.rvm/rubies/ruby-2.5.0/bin/irb:11:in `<main>'
        2: from (irb):5
        1: from /Users/simonyi/Projects/airport_challenge/lib/airport.rb:16:in `land'
RuntimeError (it is stormy)
2.5.0 :006 > airport.land(plane)
 => [#<Plane:0x00007fb3bb1f4b88>]
2.5.0 :007 > plane
 => #<Plane:0x00007fb3bb1f4b88>
2.5.0 :008 >
```

Unit tests.  
```
      it 'call land? method to plane' do
        allow(weather).to receive(:stormy?).and_return(false)
        expect(plane).to receive(:land?)
        subject.land(plane)
      end
```

#### programme code.  

```
  def land(plane)
    raise "it is stormy" if weather.stormy?

    raise "airport apron is full" if airport_apron.size >= capcity

    plane.land?
    airport_apron << plane
  end
```

#### update the unit tests to make the all test pass
* use ‘before do’ to extra shared condition.  
* use a method to regular the behaviour of double : plane, and replace the double :plane by calling the method.

```
  before(:each) do
    @weather = double :weather
    @subject = described_class.new(weather)

    def plane_example
      plane = double :plane
      allow(plane).to receive(:land?)
      plane
    end

    @plane = plane_example
    @plane2 = plane_example
    @plane3 = plane_example
  end
```

```
      it 'allow to land when airport_apron is not full' do
        (described_class::DEFAULT_CAPACITY - 1).times { subject.land(plane_example) }
        subject.land(plane)
        expect(subject.airport_apron.last).to eq plane
      end

      it 'rasie error if try to land when airport_apron is full' do
        allow(weather).to receive(:stormy?).and_return(false)
        described_class::DEFAULT_CAPACITY.times { subject.land(plane_example) }
        expect { subject.land(plane_example) }.to raise_error "airport apron is full"
      end

      it 'allow to land when the reset capcity is not met yet' do
        capcity = rand(5..10)
        subject = described_class.new(weather, capcity)
        (capcity - 1).times { subject.land(plane_example) }
        subject.land(plane)
        expect(subject.airport_apron.last).to eq plane
      end

      it 'rasie error if try to land when is over the reset airport capacity' do
        capcity = rand(5..10)
        subject = described_class.new(weather, capcity)
        capcity.times { subject.land(plane_example) }
        expect { subject.land(plane_example) }.to raise_error "airport apron is full"
      end
```

#### Feature test.
 Pass the feature test.    

```
2.5.0 :001 > require './lib/airport.rb'
 => true
2.5.0 :002 > weather = Weather.new
 => #<Weather:0x00007fabfd140b08>
2.5.0 :003 > airport = Airport.new(weather,3)
 => #<Airport:0x00007fabfd12f740 @weather=#<Weather:0x00007fabfd140b08>, @airport_apron=[], @capcity=3>
2.5.0 :004 > plane = Plane.new
 => #<Plane:0x00007fabfd127888>
2.5.0 :005 > airport.land(plane)
Traceback (most recent call last):
        3: from /Users/simonyi/.rvm/rubies/ruby-2.5.0/bin/irb:11:in `<main>'
        2: from (irb):5
        1: from /Users/simonyi/Projects/airport_challenge/lib/airport.rb:16:in `land'
RuntimeError (it is stormy)
2.5.0 :006 > airport.land(plane)
Traceback (most recent call last):
        3: from /Users/simonyi/.rvm/rubies/ruby-2.5.0/bin/irb:11:in `<main>'
        2: from (irb):6
        1: from /Users/simonyi/Projects/airport_challenge/lib/airport.rb:16:in `land'
RuntimeError (it is stormy)
2.5.0 :007 > airport.land(plane)
 => [#<Plane:0x00007fabfd127888 @landed=true>]
2.5.0 :008 > plane
 => #<Plane:0x00007fabfd127888 @landed=true>
2.5.0 :009 >
```
