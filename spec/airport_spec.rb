require 'airport.rb'
describe Airport do
    it 'Parks a plane'
        plane = Plane.new
        expect (subject.parked(plane)).to eq plane
end