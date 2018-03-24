require 'plane'

describe Plane do
  subject(:plane) { described_class.new }

  describe '#land_plane'
  it ' can be landed by responding to land_plane' do
    expect(plane).to respond_to(:land_plane)
  end

  describe '#land_plane'
  it 'lands the plane at the given airport' do
    expect(plane).to respond_to(:land_plane).with(1).argument
  end
end
