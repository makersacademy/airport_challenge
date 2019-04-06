require 'airport'

describe Airport do

  subject(:airport) { described_class.new(50) }

  it 'tells a plane to land at an airport' do
    expect(airport).to respond_to(:land_plane).with(1).argument
  end

  it 'tells a plane to take off from an airport' do
    expect(airport).to respond_to(:take_off).with(1).argument
  end

  it 'will not let planes land when full' do
    plane = double :plane
    50.times do
      airport.land_plane(plane)
    end
    expect { airport.land_plane(plane) }.to raise_error "Airport is full"
  end

end
