require 'airport'
require 'plane'
require 'helper_methods_module'

RSpec.describe Airport do
  include HelperMethodsModule

  let(:plane) { Plane.new }

  context "LAND: instructs plane to" do

    it "land at an airport" do
      subject.land(plane)
      subject.land(plane)
      subject.land(plane)
      weather(:sunny)
      expect(subject.land(plane)).to eq("Landed")
      expect(subject.hangar).to include(plane)
    end

    it "land at an airport only if there is available space" do
      airport = Airport.new("LHR",0)
      airport.weather = :sunny
      airport.land(plane)
      airport.land(plane)
      
      expect(airport.land(plane)).to eq("Landing not possible")
    end 

    it "not land if weather is stormy" do
      weather(:stormy)
      expect(subject.land(plane)).to eq "Stormy weather: landing denied"
    end

  end

  context "TAKEOFF: instructs plane" do

    it "to take_off and confirm it has taken off" do 
      weather(:sunny)
      expect(subject.takeoff(plane)).to eq("Plane has taken off")
    end

    it "to not take off if weather is stormy" do
      weather(:stormy)
      expect(subject.takeoff(plane)).to eq "Stormy weather: Take off denied"
    end

  end

end
