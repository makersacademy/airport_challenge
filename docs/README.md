# Brief explanation of my approach

```ruby
require 'airport'

describe Airport do # to test the Airport class
  it "instructs a plane to land at the airport" do
    plane = Plane.new # to instantiate a new plane class
    expect(subject.land plane).to eq true # to confirm the plane landed is now at the airport
  end

  it "instructs a plane to take off from the airport" do
    expect(subject.take_off).to eq false # to confirm the plane taken off is now not at the airport
  end

  it "confirms a plane is no longer at the airport after takeoff" do
    subject.take_off
    expect(subject.at_airport?).to eq false # to confirm the plane taken off is now not at the airport
  end

  it "prevents landing when airport is full" do
    Airport::DEFAULT_CAPACITY.times do # to fill the airport completely
      subject.land Plane.new
    end
    expect { subject.land Plane.new }.to raise_error "Airport full" # to raise an error when a new plane tries to land at a full airport
  end

  it "prevents takeoff when stormy" do
    subject.check_weather('stormy')
    expect { subject.take_off }.to raise_error "Takeoff prevented due to storm" # to raise an error when a new plane tries to take off in a storm
  end

  it "updates capacity from default 100 to 80" do
    expect(subject.capacity).to eq (100) # to read the original capacity
    subject.capacity = 80 # to update the original capacity
    expect(subject.capacity).to eq (80)# to read the updated capacity
  end
end
```