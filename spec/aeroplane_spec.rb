require 'aeroplane'

describe Aeroplane do

  let(:plane) { Aeroplane.new }

  describe 'land' do
    it 'lands the plane' do
      plane.land
      expect(plane.landed).to be true
    end
  end

  describe 'fly' do
    it 'lets plane take off' do
      plane.fly
      expect(plane.landed).to be false
    end
  end
end
