require 'plane'

describe Plane do
  subject(:plane) { described_class.new }

  describe '#take_off' do
    it 'cannot take off if already flying' do
      flying_plane = Plane.new
      message = "Plane cannot take off, already flying!"
      expect { flying_plane.take_off }.to raise_error message
    end
  end
end
