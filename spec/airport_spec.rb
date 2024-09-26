require './lib/airport.rb'
require './lib/plane.rb'

describe Airport do 
    subject(:airport) { described_class.new(20) }

    #I want to instruct a plane to land at an airport
    it "responds to .land a #plane" do
        expect(airport).to respond_to(:land_plane).with(1).argument
    end

    #I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
    it "responds to .plane_take_off and is no longer in the #Airport" do
        expect(airport).to respond_to(:plane_take_off).with(1).argument
    end
    #I want to prevent landing when the airport is full 
    it "no planes allowed to land when airport full" do
        plane = double :plane
      20.times do
        airport.land_plane(plane)
      end
      expect { airport.land_plane(plane) }.to raise_error "no planes allowed to land when airport full"
    end
end

