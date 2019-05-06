require 'plane'

describe Plane do
  describe '#landed' do
    it 'specifies that a plane is no longer airborne' do
      plane = Plane.new
      plane.landed
      expect(plane.airborne).to eq(false)
    end
  end

  describe '#taken_off' do
    it 'specifies that a plane is airborne' do
      plane = Plane.new
      plane.landed
      plane.taken_off
      expect(plane.airborne).to eq(true)
    end
  end
end
