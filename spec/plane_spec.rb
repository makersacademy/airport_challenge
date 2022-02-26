require 'plane'

describe Plane do

  before :each do
    @plane = Plane.new('name')
  end

  describe '#new' do

    it 'returns a new plane object' do
      expect(@plane).to be_an_instance_of(Plane)
    end

    it 'takes one parameter and returns a plane object' do
      plane = Plane.new('Douglas A-4 Skyhawk')
      expect(@plane).to be_an_instance_of(Plane)
    end

  end

end
