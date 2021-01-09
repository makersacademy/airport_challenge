require 'airport'
require 'plane'

describe Airport do

    it {is_expected.to respond_to(:land).with(1).argument}
    
    it 'stores planes in hangar when they land' do
        plane = Plane.new
        expect (subject.land(plane)) == @hangar
    end
    
end
