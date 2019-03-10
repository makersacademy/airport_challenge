require 'airport'
require 'plane'
require 'helper_methods_module'

RSpec.describe Airport do
  include HelperMethodsModule

  let(:plane) { Plane.new }

  context "instructs plane to" do

    it "land at an airport" do
      expect(subject.land(plane)).to eq("Landed")
      expect(subject.hangar).to include(plane)
    end

    it "land at an airport only if there is available space" do
      airport = Airport.new(0)
      airport.land(plane)
      
      expect(airport.land(plane)).to eq("Landing not possible")
    end 

    it "not land if weather is stormy" do
    
    end

  end

  context "instructs plane" do

    it "to take_off and confirm it has taken off" do 
      weather(:good)
      expect(subject.takeoff(plane)).to eq("Plane has taken off")
    end

    it "to not take off if weather is stormy" do
      weather(:bad)
      expect(subject.takeoff(plane)).to eq "Stormy weather: Take off denied"
    end

  end

end
