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
      airport = Airport.new("LHR", 0)
      airport.weather = :sunny
      airport.land(plane)
      airport.land(plane)
      
      expect(airport.land(plane)).to eq("Landing not possible")
    end 

    it "not land if weather is stormy" do
      weather(:stormy)
      expect(subject.land(plane)).to eq "Stormy weather: landing denied"
    end

    it "not land if it has already landed at the airport" do
      airport = Airport.new("LHR", 2)
      airport.weather = :sunny
      plane_test = Plane.new
    
      airport.land(plane_test)

      expect(airport.land(plane_test)).to eq("Not possibile -> Plane already landed")
    end

    it "confirms plane is in the right airport" do
      airport = Airport.new("LHR", 2)
      airport.weather = :sunny
      airport.land(plane)

      expect(airport.hangar.first.airport.name).to eq airport.name
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

    it "takes off from the airport it is in" do
      plane_test = Plane.new
      subject.land(plane_test)
      
      expect(subject.name).to eq plane_test.airport.name
      expect(plane_test.status).to eq :landed

      weather(:sunny)
      subject.takeoff(plane_test)
   
      expect(subject.hangar).not_to include plane_test
      expect(plane_test.status).to eq :flying
    end

    it "cannot receive takeoff command if already flying" do

    end

  end

end
