require 'airport'

describe Airport do

  subject(:airport) { described_class.new }

  it 'tells a plane to land at an airport' do
    expect(airport).to respond_to(:land_plane).with(1).argument
  end

  it 'tells a plane to take off from an airport' do
    expect(airport).to respond_to(:take_off).with(1).argument
  end

end
