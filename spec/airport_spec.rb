require 'airport'

describe Airport do

  it 'instructs plane to land at airport' do
    plane = Plane.new
    airport = Airport.new

    airport.land_plane(plane)

    expect(airport.print_planes).to include(plane)
  end

  it 'instructs plane to take off from airport' do
    plane = Plane.new
    airport = Airport.new

    airport.land_plane(plane)
    takeoff = airport.take_off_plane

    expect(airport.print_planes).to eq([])
    expect(airport.print_planes).not_to include(takeoff)
  end

  it 'prevents landing when airport is full' do
    airport = Airport.new
    10.times { airport.land_plane Plane.new }
    expect { airport.land_plane Plane.new }.to raise_error 'Airport is full'
  end

  it 'prevents landing if weather is stormy' do
    plane = Plane.new
    subject.weather_conditions('stormy')

    expect { subject.land_plane(plane) }.to raise_error 'Weather is bad!'
  end

  it 'prevents taking off if weather is stormy' do
    plane = Plane.new
    subject.land_plane(plane)
    subject.weather_conditions('stormy')

    expect { subject.take_off_plane }.to raise_error 'Weather is bad!'
  end

end
