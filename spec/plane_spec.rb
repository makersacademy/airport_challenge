require 'Plane'

describe Plane do

  describe '#fly' do
    plane = Plane.new
    plane.fly
    it 'changes the plane flying attribute to true' do
      expect(plane.flying).to eq true
    end
  end
end
