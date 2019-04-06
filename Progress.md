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

> Plan <— land —>  true/false.
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
