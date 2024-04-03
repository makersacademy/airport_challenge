require 'airport'
require 'plane'

describe Airport do

    it {is_expected.to respond_to(:land).with(1).argument}
    
    it 'stores planes in hangar when they land' do
        plane = Plane.new
        expect (subject.land(plane)) == @hangar
    end

    it {is_expected.to respond_to(:takeoff)}

    it 'removes planes from hangar when they takeoff' do
        expect (subject.takeoff) == @hangar
    end

    it "raises error - Hangar is empty" do
        expect {subject.takeoff}.to raise_error
    end
    
end
