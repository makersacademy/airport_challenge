require 'airport.rb'
require 'plane.rb'

describe Airport do

    let( :airport ) { Airport.new }
    let( :plane ) { Plane.new }

    it 'instruct plane to land' do
        expect(airport.land(plane)).to eq landed
    end

    it 'plane can take off' do
        expect(airport.take_off(plane)).to eq flying
    end

end