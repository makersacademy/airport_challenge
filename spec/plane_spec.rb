require 'plane.rb'
require 'airport.rb'

heathrow = Airport.new

describe Plane do
  ## Taking off
  
  it 'Should respond to #land' do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it 'Should set @location to the name of the airport landed at' do
    subject.land(heathrow)
    subject.location.should eq(heathrow)
  end

  it 'Should raise an error if the plane is not currently at an airport' do
    houston = Airport.new
    expect { subject.take_off(houston) }.to raise_error('The plane is not at this airport')
  end

  ## Landing
  it 'Should respond to #take_off' do
    expect(subject).to respond_to(:take_off).with(1).argument
  end

  it 'Should set @last_airport equal to where the plane left from' do
    subject.land(heathrow)
    subject.take_off(heathrow)
    subject.last_airport.should eq(heathrow)
  end

  it 'Should set @location to "in the air" if takeoff is done succesfully' do
    subject.land(heathrow)
    subject.take_off(heathrow)
    subject.location.should eq("in the air")
  end

  it 'Should confirm that it is no longer in an airport after takeoff' do
    expect(subject).to respond_to(:location?)
    expect(subject.location?).to eq "The plane is in the air."
  end

  it 'Should confirm the planes new location after takeoff' do
    subject.land(heathrow)
    expect(subject.take_off(heathrow)).to eq "The plane is in the air."
  end

  it 'Doesn\'t let a plane land if the hangar is full' do
    paris = Airport.new
    Airport::DEFAULT_CAPACITY.times { paris.add_plane }
    expect { subject.land(paris) }.to raise_error('The hangar is full.')
  end

  it 'Should not land if the plane is already at an airport' do
    subject.land(heathrow)
    expect { subject.land(heathrow) }.to raise_error("Can't land if not in the air.")
  end

end