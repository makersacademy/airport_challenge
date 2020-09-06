require 'plane.rb'

heathrow = Airport.new
weather = Weather.new

describe Plane do
  # Landing
  it 'Should respond to #land' do
    expect(subject).to respond_to(:land).with(2).arguments
  end

  it 'Should set @location to the name of the airport landed at' do
    allow(weather).to receive(:weather_now?) { "sunny" }
    subject.land(heathrow, weather)
    subject.location.should eq(heathrow)
  end

  it 'Should raise an error if the plane is not currently at an airport' do
    houston = Airport.new
    expect { subject.take_off(houston, weather) }.to raise_error('The plane is not at this airport.')
  end

  it 'Doesn\'t let a plane land if the hangar is full' do
    allow(weather).to receive(:weather_now?) { "sunny" }
    paris = Airport.new
    Airport::DEFAULT_CAPACITY.times { paris.add_plane }
    expect { subject.land(paris, weather) }.to raise_error('The hangar is full.')
  end

  it 'Should not land if the plane is already at an airport' do
    allow(weather).to receive(:weather_now?) { "sunny" }
    subject.land(heathrow, weather)
    expect { subject.land(heathrow, weather) }.to raise_error("Can't land if not in the air.")
  end

  it 'Should not land if the weather is stormy' do
    allow(weather).to receive(:weather_now?) { "stormy" }
    expect { subject.land(heathrow, weather) }.to raise_error("Can't land in stormy weather.")
  end

  # Take off
  it 'Should respond to #take_off' do
    allow(weather).to receive(:weather_now?) { "sunny" }
    expect(subject).to respond_to(:take_off).with(2).arguments
  end

  it 'Should set @last_airport equal to where the plane left from' do
    allow(weather).to receive(:weather_now?) { "sunny" }
    subject.land(heathrow, weather)
    subject.take_off(heathrow, weather)
    subject.last_airport.should eq(heathrow)
  end

  it 'Should set @location to "in the air" if takeoff is done succesfully' do
    allow(weather).to receive(:weather_now?) { "sunny" }
    subject.land(heathrow, weather)
    subject.take_off(heathrow, weather)
    subject.location.should eq("in the air")
  end

  it 'Should confirm that it is no longer in an airport after takeoff' do
    allow(weather).to receive(:weather_now?) { "sunny" }
    expect(subject).to respond_to(:location?)
    expect(subject.location?).to eq "The plane is in the air."
  end

  it "Should confirm the plane's new location after takeoff" do
    allow(weather).to receive(:weather_now?) { "sunny" }
    subject.land(heathrow, weather)
    expect(subject.take_off(heathrow, weather)).to eq "The plane is in the air."
  end

  it 'Should not take off if the weather is stormy' do
    allow(weather).to receive(:weather_now?) { "sunny" }
    subject.land(heathrow, weather)
    allow(weather).to receive(:weather_now?) { "stormy" }
    expect { subject.take_off(heathrow, weather) }.to raise_error("Can't take off in stormy weather.")
  end
end
