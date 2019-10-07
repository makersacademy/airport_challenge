require 'airport'

describe Airport do

  let (:plane) { double :plane }

  it 'instructs plane to land at airport' do
    # plane = Plane.new
    # airport = Airport.new

    subject.land_plane(plane)

    expect(subject.planes).to include(plane)
  end

  it 'instructs plane to take off from airport' do
    # plane = Plane.new
    # airport = Airport.new

    subject.land_plane(plane)
    takeoff = subject.take_off_plane

    expect(subject.planes).to eq([])
    expect(subject.planes).not_to include(takeoff)
  end

  it 'prevents landing when airport is full' do
    # airport = Airport.new
    10.times { subject.land_plane plane }
    expect { subject.land_plane plane }.to raise_error 'Airport is full'
  end

  it 'prevents landing if weather is stormy' do
    # plane = Plane.new
    subject.weather_conditions('stormy')

    expect { subject.land_plane(plane) }.to raise_error 'Weather is bad!'
  end

  it 'prevents taking off if weather is stormy' do
    # plane = Plane.new
    subject.land_plane(plane)
    subject.weather_conditions('stormy')

    expect { subject.take_off_plane }.to raise_error 'Weather is bad!'
  end

end
