require 'airport'
require 'plane'
require 'helper_methods_module'

RSpec.describe Airport do
  include HelperMethodsModule

  let(:plane) { Plane.new }

  def land_and_takeoff 
    weather(:sunny)
    subject.land(plane)
    subject.takeoff(plane)
  end

  context "LAND: instructs plane to" do

    it "land at an airport" do
      weather(:sunny) 
      expect(subject.land(plane)).to eq("Landed")
      expect(subject.hangar).to include(plane)
    end

    it "land at an airport only if there is available space" do
      airport = Airport.new("LHR", 0)
      airport.weather = :sunny
      2.times { airport.land(plane) }
      
      expect(airport.land(plane)).to eq("Landing not possible")
    end 

    it "not land if weather is stormy" do
      weather(:stormy)
      expect(subject.land(plane)).to eq "Stormy weather: landing denied"
    end

    it "not land if it has already landed at the airport" do
      airport = Airport.new("LHR", 2)
      airport.weather = :sunny
      airport.land(plane)

      expect(airport.land(plane)).to eq("Not possibile -> Plane already landed")
    end

    it "confirms plane is in the right airport" do
      weather(:sunny)
      subject.land(plane)

      expect(subject.hangar.first.airport.name).to eq subject.name
    end

  end

  context "TAKEOFF: instructs plane" do

    it "to take_off and confirm it has taken off" do 
      weather(:sunny)
      subject.land(plane)
      expect(subject.takeoff(plane)).to eq("Plane has taken off")
    end

    it "to not take off if weather is stormy" do
      weather(:stormy)
      expect(subject.takeoff(plane)).to eq "Stormy weather: Take off denied"
    end

    it "takes off from the airport it is in" do
      subject.land(plane)
      expect(subject.name).to eq plane.airport.name
      expect(plane.status).to eq :landed

      weather(:sunny)
      subject.takeoff(plane)
      expect(subject.hangar).not_to include plane
      expect(plane.status).to eq :flying
      expect(plane.airport).to eq nil
    end

    it "cannot receive takeoff command if already flying" do
      land_and_takeoff
      expect(subject.takeoff(plane)).to eq "Plane already flying"
    end

    it "cannot be in the airport if already flying" do
      land_and_takeoff
      expect(subject.hangar).not_to include plane
    end

  end

  context "test landing and takingoff of multiple planes" do
    it "allows landing of multiple planes " do
      count = land_multiple_planes(10)
      expect(subject.hangar.count).to be >= count
    end

    it "allows multiple plane takeoff" do
      land_multiple_planes(10)
      count = takeoff_multiple_planes
      expect(subject.hangar.size).to be >= count
    end

    it "prevents landing if no space" do
      count = land_multiple_planes(100)
      weather(:sunny)
      expect(subject.land(plane)).to eq "Landing not possible"
    end
  end

end