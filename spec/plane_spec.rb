require 'plane'

describe Plane do
  subject(:plane) { Plane.new }

  describe '#landed?' do
    it 'say the plane has landed' do
      plane.land
      expect(plane.landed?).to eq true
    end
  end

end
