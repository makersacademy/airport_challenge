require 'airport.rb'
require 'plane.rb'

describe Airport do
    let( :airport ) { Airport.new }
    let( :plane ) { Plane.new }

    it 'instruct plane to land' do
        expect(airport.land(plane)).to eq "the plane can land"
    end

    it 'instruct plane to take off' do
        expect(airport.take_off(plane)).to eq "the plane can take off"
    end

    it 'plane can\'t land if airport full' do
        expect(airport.full?(6)).to eq "Airport full"
    end
end