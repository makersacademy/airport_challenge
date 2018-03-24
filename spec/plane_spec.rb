require 'plane'

describe Plane do
  subject(:plane) { described_class.new }

  describe '#land_plane'
  it 'responds to land_plane' do
    expect(plane).to respond_to(:land_plane)
  end
end
