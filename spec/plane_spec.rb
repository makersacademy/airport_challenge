require 'plane'
require 'airport'

describe Plane do
    
    it 'lands' do
        plane = Plane.new
        expect(plane.land).to eq plane
    end

    it 'takes off' do
        plane = Plane.new
        expect(plane.land).to eq plane
    end
end