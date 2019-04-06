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
