require 'plane'

describe Plane do
  subject(:plane) { Plane.new }

  describe '#landed?' do
    it 'say the plane has landed' do
      plane.land
      expect(plane.landed?).to eq true
    end
  end
  
  describe '#take_off' do
    it 'shows the plane has left' do
      plane.take_off
      expect(plane.landed?).to eq false
    end
  end

end
