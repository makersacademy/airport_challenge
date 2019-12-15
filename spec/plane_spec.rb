require 'plane'

describe Plane do
    
    it 'confirms that a plane is no longer at the airport' do
        plane = Plane.new
        expect(plane.landed?).to be false
    end
end