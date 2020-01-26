require 'airport'
require_relative  '../lib/plane'



describe Airport do

     it 'plane lands' do
        # airport = Airport.new
        # expect airport.hanger.length == 1
        plane = Plane.new
        expect(subject.land(plane)).to include plane
    end

    it 'plane takes off' do
        plane = Plane.new
        expect(subject.take_off(plane)).not_to include plane
    end

    it 'raises error when hanger full' do
        5.times { subject.land Plane.new }
        expect{ subject.land Plane.new }.to raise_error("Airport Full")
    end

    it 'has a count override' do
        airport = Airport.new(1)
        airport.land Plane.new 
        expect { airport.land Plane.new }.to raise_error("Airport Full")
    end     

    # it "prevents take off when weather is stormy" do
    #     airport = Airport.new
    #     airport.land Plane.new
    #     expect { aiport.take_off(plane)
    # end

end
