
require 'plane'

describe Plane do 
    it 'should instruct plane to land' do 
        plane = Plane.new
        expect(plane.land).to eq plane
    end 

    
end 