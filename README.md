# Airport Challenge <div align="right">[![Coverage Status](https://coveralls.io/repos/github/makersacademy/airport_challenge/badge.svg)](https://coveralls.io/github/makersacademy/airport_challenge)</div>
### [Makers Academy] (http://www.makersacademy.com) - Week 1 Solo Weekend Project

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

## Task

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off. Here are the user stories that we worked out in collaboration with the client:

## User Stories
* [User Story 1 : Land Plane] (#U1)
* [User Story 2 : Takeoff Plane] (#U2)
* [User Story 3 : Prevent takeoff when weather is stormy] (#U3)
* [User Story 4 : Prevent landing when weather is stormy] (#U4)
* [User Story 5 : Prevent landing when the airport is full] (#U5)
* [User Story 6 : Overridden default airport capacity] (#U6)
* [Extra Rspec Tests] (#RSPEC)
* [Final Ruby Code] (#CODE)

## <a name="U1">User Story 1 : Land Plane</a>
```
As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport and confirm that it has landed 
```
RSPEC Tests
```ruby
# FILE: airport_spec.rb
describe Airport do
  # Create a double of airplane
  let(:airplane) {double :airplane, :landed= => false, landed?: false}
  let(:weather) {double :weather, :sunny= => true, sunny?: true}

  # TEST: Respond to method land_plane
  it { is_expected.to respond_to :land_plane }

  # TEST: Check method land_plane responds to 1 argument
  it { is_expected.to respond_to(:land_plane).with(1).argument }

  # TEST: Respond to Array airplanes
  it { is_expected.to respond_to :airplanes }

  # TEST: Check that there are no planes at a new airport
  it "Check to see if there are no planes initially at the airport" do
    expect(subject.airplanes).to eq []
  end

  # TEST: Allow a plane to land at an airport
  it "Land a plane at the airport and confirm" do
    subject.sunny = true
    allow(airplane).to receive(:landed).and_return(false)
    expect(subject.land_plane(airplane)).to include(airplane)
  end
end

# FILE: airplane_spec.rb

describe Airplane do
  # TEST: Respond to Method landing
  it { is_expected.to respond_to :landed? }

  # TEST: Respond to Variable landing
  it { is_expected.to respond_to :landed }

  # TEST: Plane status
  it "Check to see if a new plane is on the group" do
    expect(subject.landed).to eq true
  end
end
```

## <a name="U2">User Story 2 : Takeoff Plane</a>
```
As an air traffic controller 
So I can get passengers on the way to their destination 
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
```

RSPEC Tests
```ruby
# FILE: airport_spec.rb

  # TEST: Respond to method takeoff_plane
  it { is_expected.to respond_to :takeoff_plane }

  # TEST: Check method takeoff_plane responds to 1 argument
  it { is_expected.to respond_to(:takeoff_plane).with(1).argument }

  # TEST: Land an airplane then take off
  it "Land an airplane then take off" do
    subject.sunny = true
    allow(airplane).to receive(:landed).and_return(false)
    subject.land_plane(airplane)
    allow(airplane).to receive(:landed).and_return(true)
    expect(subject.takeoff_plane(airplane)).to eq airplane
  end

  # TEST: Check that an airplane that has taken off is in the air
  it "Check an airplane that is in the sky is not landed" do
    subject.sunny = true
    allow(airplane).to receive(:landed).and_return(false)
    subject.land_plane(airplane)
    allow(airplane).to receive(:landed).and_return(true)
    subject.takeoff_plane(airplane)
    expect(airplane).to_not be_landed
  end

  # TEST: Land airplane, take off then check that it isn't at the airport
  it "Make sure an airplane that as taken off is not at the airport" do
    subject.sunny = true
    allow(airplane).to receive(:landed).and_return(false)
    subject.land_plane(airplane)
    allow(airplane).to receive(:landed).and_return(true)
    subject.takeoff_plane(airplane)
    expect(subject.airplanes).to_not include(airplane)
  end
  ```

## <a name="U3">User Story 3 : Prevent takeoff when weather is stormy</a>
```
As an air traffic controller 
To ensure safety 
I want to prevent takeoff when weather is stormy 
```

RSPEC Tests
```ruby
# FILE: airport_spec.rb

  # TEST: Land an airplane and prevent it to take off if weather not sunny
  it "Prevent airplane to take off if not sunny" do
    subject.sunny = true
    allow(airplane).to receive(:landed).and_return(false)
    subject.land_plane(airplane)
    subject.sunny = false
    error = "Weather Stormy cannot take off"
    expect{subject.takeoff_plane(airplane)}.to raise_error error
  end
  
# FILE: airplane.rb

  let(:weather) {double :weather, :sunny= => true, sunny?: true}

  # TEST: Respond to Variable condition
  it { is_expected.to respond_to :sunny }

  # TEST: Check weather condition
  it "Check weather = sunny" do
    expect(weather).to be_sunny
  end

  # TEST: Check weather condition
  let(:weather2) {double :weather, :sunny= => false, sunny?: false}
  it "Check weather != sunny" do
    allow(weather2).to receive(:sunny).and_return(false)
    expect(weather2).to_not be_sunny
  end
```
 
## <a name="U4">User Story 4 : Prevent landing when weather is stormy</a>
```
As an air traffic controller 
To ensure safety 
I want to prevent landing when weather is stormy
```

RSPEC Tests
```ruby
# FILE: airport_spec.rb

  # TEST: Prevent landing if weather is Stormy
  it "Prevent airplane to land if not sunny" do
    subject.sunny = false
    error =  "Weather Stormy cannot land"
    expect{subject.land_plane(airplane)}.to raise_error error
  end
```

## <a name="U5">User Story 5 : Prevent landing when the airport is full</a>
```
As an air traffic controller 
To ensure safety 
I want to prevent landing when the airport is full 
```

RSPEC Tests
```ruby
# FILE: airport_spec.rb

  # TEST: Land DEFAULT_CAPACITY amount of planes then try and land another
  it "Raise an error if the airport is full" do
    subject.sunny = true
    allow(airplane).to receive(:landed).and_return(false)
    Airport::DEFAULT_CAPACITY.times { subject.land_plane(airplane) }
    expect{subject.land_plane(airplane)}.to raise_error "Airport full!"
  end

  # TEST: Fill the airport up, remove one airplane then land another
  it "Check to see if you can fill, remove then fill airport" do
    subject.sunny = true
    allow(airplane).to receive(:landed).and_return(false)
    Airport::DEFAULT_CAPACITY.times { subject.land_plane(airplane) }
    allow(airplane).to receive(:landed).and_return(true)
    subject.takeoff_plane(airplane)
    expect(subject.airplanes).to include(airplane)
  end
```

## <a name="U6">User Story 6 : Overridden default airport capacity</a>
```
As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```

RSPEC Tests
```ruby
# FILE: airport_spec.rb

  # TEST: Overwrite default airport capacity
  it "Overwrite default airport capacity to 30" do
    expect(subject.capacity=30).to eq 30
  end

  # TEST: Overwrite default airport capacity to 50 when initialising class
  it "Overwrite default airport capacity to 50 when initialising class" do
    airport = Airport.new(50)
    expect(airport.capacity).to eq 50
  end
```

## <a name="RSPEC">Extra RSPEC Tests</a>
RSPEC Tests
```ruby
# FILE: airport_spec.rb

# TEST: raise error if you try and takeoff a plane that is not at the airport
  it "Raise error if plane already in sky and try takeoff" do
    subject.sunny = true
    allow(airplane).to receive(:landed).and_return(false)
    error = "Airplane is already in the sky!"
    expect{subject.takeoff_plane(airplane)}.to raise_error error
  end

  # TEST: Raise error if plane already tries to land when already at airport
  it "Raise error if plane already tries to land when already at airport" do
    subject.sunny = true
    allow(airplane).to receive(:landed).and_return(false)
    subject.land_plane(airplane)
    allow(airplane).to receive(:landed).and_return(true)
    error = "Airplane is already here"
    expect{subject.land_plane(airplane)}.to raise_error error
  end

  # TEST: raise error if you try and takeoff an airplane that is not at airport
  let(:airplane2) {double :airplane, :landed= => true, landed?: true}
  it "Raise error if plane not at airport and try to takeoff" do
    subject.sunny = true
    allow(airplane2).to receive(:landed).and_return(true)
    error = "Airplane is not at this airport"
    expect{subject.takeoff_plane(airplane2)}.to raise_error error
  end
```

## <a name="CODE">Final Ruby Code</a>

<b> airport.rb </b>
```ruby
require_relative "airplane"
require_relative "weather"

class Airport

  DEFAULT_CAPACITY = 20

  attr_reader :airplanes
  attr_accessor :capacity, :sunny

  def initialize(capacity=DEFAULT_CAPACITY)
    @airplanes = []
    @capacity = capacity
    condition = Weather.new
    @weather = condition.sunny
  end

  def land_plane(airplane)
    fail "Airport full!" if airplanes.length == capacity
    fail "Weather Stormy cannot land" unless sunny
    fail "Airplane is already here" if airplane.landed
    airplane.landed = true
    airplanes << airplane
  end

  def takeoff_plane(airplane)
    fail "Weather Stormy cannot take off" unless sunny
    fail "Airplane is already in the sky!" unless airplane.landed
    return airplane if check_plane(airplane) == airplane
    fail "Airplane is not at this airport"
  end

  private

  def check_plane(airplane)
    airplanes.each_with_index do |check,index|
      next unless check == airplane
      airplanes.delete_at(index)
      airplane.landed = false
      return airplane
    end
  end

end
```

<b> airplane.rb </b>
```ruby
class Airplane
  attr_accessor :landed

  def initialize(status=true)
    @landed = status
  end

  def landed?
    landed
  end
end
```

<b> weather.rb </b>
```ruby
class Weather

  attr_reader :sunny

  def initialize
    rand(10) == 0 ? @sunny = false : @sunny = true
  end

  def sunny?
    sunny
  end
end
```
