require 'plane'

describe Plane do

  describe '#new' do

    it 'returns a new plane object' do
      plane = Plane.new
      expect(plane).to be_an_instance_of(Plane)
    end
    
  end

end
