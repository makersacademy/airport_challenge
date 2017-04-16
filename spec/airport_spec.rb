require 'airport'
require 'plane'
require 'weather'

describe Airport do
  # lets us simply use 'plane' for a new instantiation of Plane in all the examples below
  let(:plane) { Plane.new }

  it 'Instructs plane to land and confirms it has landed' do
    # this line stubs the 'weather_today' method called in Airport's initialize method
    allow_any_instance_of(Airport).to receive(:weather_today).and_return("sunny")
    subject.land(plane)
    # after we have landed a new plane, compares the object IDs to check the plane in the slot is identical.
    expect(subject.slots[-1].object_id).to eq plane.object_id
  end

  it 'Instructs plane to takeoff and confirms it has left' do
    # this line stubs the 'weather_today' method called in Airport's initialize method
    allow_any_instance_of(Airport).to receive(:weather_today).and_return("sunny")
    subject.slots.push(plane)
    subject.takeoff(0)
    # after deleting the plane from the array, the next line confirms the array is now empty of elements
    expect(subject.slots.empty?).to eq true
  end

  it 'Prevents takeoff when weather is stormy' do
    subject.slots.push(plane)
    # ensures the weather is stormy for this example
    subject.weather = "stormy"
    # checks that the expected error is raised when a plane tries to take off
    expect { subject.takeoff(0) }.to raise_error "Weather conditions too dangerous for take-off"
  end

  it 'Prevents landing when weather is stormy' do
    # ensures the weather is stormy for this example
    subject.weather = "stormy"
    # checks that the expected error is raised when a plane tries to land
    expect { subject.land(plane) }.to raise_error "Weather conditions too dangerous for landing"
  end

  it 'Allows takeoff when weather is sunny' do
    subject.slots.push(plane)
    # Ensures the weather is sunny
    subject.weather = "sunny"
    # after takeoff, checks that the object deleted from the array has the same object ID as the plane we originally created
    expect(subject.takeoff(0).object_id).to eq plane.object_id
  end

  it 'Allows landing when weather is sunny' do
    # ensures weather is sunny
    subject.weather = "sunny"
    subject.land(plane)
    # checks that the object added to the array has an identical ID to the one we created above
    expect(subject.slots[-1].object_id).to eq plane.object_id
  end

  it 'Prevents landing when airport is full' do
    # this line stubs the 'weather_today' method called in Airport's initialize method
    allow_any_instance_of(Airport).to receive(:weather_today).and_return("sunny")
    # Creates a number of planes equal to the limit set out in our slot_limit variable, then 'lands' them in our array
    subject.slot_limit.times { subject.land(plane) }
    # Creates one extra plane, tries to add this, and expects an error to inform us the airport is at full capacity.
    expect { subject.land(plane) }.to raise_error "All airport landing slots currently occupied"
  end

  it 'Sets a default slot limit that can be overriden upon initialization' do
    # this line stubs the 'weather_today' method called in Airport's initialize method
    allow_any_instance_of(Airport).to receive(:weather_today).and_return("sunny")
    # Creates a new airport object with a parameter of 40, which will be passed through to our 'slot_limit' variable
    airport = Airport.new(40)
    # Creates a number of planes equal to the limit set out in our capacity variable, then 'lands' them in our array
    40.times { airport.land(plane) }
    # Confirms that 'slot_limit' is indeed equal to the parameter we gave when we created the airport object
    expect(airport.slot_limit).to eq 40
    # We try to add one more plane object to the airport array, and hope it gives us this error
    expect { airport.land(plane) }.to raise_error "All airport landing slots currently occupied"
    # Confirms that slot_limit is set to 30 by default if no parameter is given upon initialization
    expect(subject.slot_limit).to eq 30
  end

end
