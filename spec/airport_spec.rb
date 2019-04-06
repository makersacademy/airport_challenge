require 'airport'

describe Airport do

  subject(:airport) { described_class.new }

  it 'lands a plane at an airport' do
    expect(airport).to respond_to(:land_plane).with(1).argument
  end

end
