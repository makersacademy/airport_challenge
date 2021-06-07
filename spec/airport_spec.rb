require 'airport'
require 'plane'

describe Airport do
  let(:airport) { Airport.new }
  let(:plane) { double :plane }
  
  it 'can land a plane at the airport' do
    expect(subject).to respond_to(:land_plane)
  end

  it 'can instruct a plane to take_off' do
    expect(subject).to respond_to(:take_off)
  end

  it 'can confirm the plane is no longer in the airport after take_off' do
    expect(subject.take_off(plane)).to eq "Successfull take-off"
  end

  it 'can prevent plane landing when airport is full' do
    subject.current_weather == "clear"
    # allow(plane).to receive(:current_location).and_return(false)
    Airport::DEFAULT_CAPACITY.times { subject.land_plane(plane) }
    expect { subject.land_plane(plane) }.to raise_error "Airport is full"
  end

  # it 'cannot land if it is already in the airport' do
  #   expect { subject.land_plane(plane) }.to raise_error "Already in airport"
  # end

  it 'gives default capacity of 10' do
    expect(subject.capacity).to eq(10)
  end
  
  it 'allows override of capacity' do
    new_airport = Airport.new(20)
    expect(new_airport.capacity).to eq(20)
  end

  it 'can set the current weather' do
    expect(subject.current_weather("stormy")).to eq "stormy"
  end

  it 'responds to stormy?' do
    expect(subject).to respond_to(:stormy?)
  end

  it 'raises error when stormy' do
    subject.current_weather("stormy")
    expect { subject.take_off(plane) }.to raise_error "Grounded due to stormy weather"
    expect { subject.land_plane(plane) }.to raise_error "Too stormy to land"
  end

  it 'clears the plane for landing' do
    plane = Plane.new
    subject.land_plane(plane)
    subject.take_off(plane)
    expect(plane.landed?).to eq false
  end
  
end
