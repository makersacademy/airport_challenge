require 'airport'
require 'airport_spec_module'

RSpec.describe Airport do
  include HelperMethodsModule

  let(:plane) { Plane.new }

  context "responds to methods" do
    it { is_expected.to respond_to(:land).with(1) }
    it { is_expected.to respond_to(:takeoff).with(1) }
  end

  context "LAND: instructs plane to" do

    let(:airport) { Airport.new("LHR", 10, :sunny) }

    it "land at an airport" do
      expect(subject.land(plane)).to eq("Landed")
      expect(subject.hangar).to include(plane)
    end

    it "land at an airport only if there is available space" do
      airport = Airport.new("LHR", 0, :sunny)
      expect { airport.land(plane) }.to raise_error("Landing not possible")
    end 

    it "not land if weather is stormy" do
      airport = Airport.new("LHR", 1, :stormy)
      expect { airport.land(plane) }.to raise_error("Stormy weather: landing denied")
    end

    it "not land if it has already landed at the airport" do
      plane = Plane.new
      subject.land(plane)

      expect { subject.land(plane) } .to raise_error("Not possibile -> Plane already landed")
    end

    it "confirms plane is in the right airport" do
      subject.land(plane)
      expect(subject.hangar.first.airport.name).to eq subject.name
    end

  end

  context "TAKEOFF: instructs plane" do
    let(:airport) { Airport.new("LHR", 1, :sunny) }

    it "to take_off and confirm it has taken off" do 
      airport.land(plane)
      expect(subject.takeoff(plane)).to eq("Plane has taken off")
    end

    it "to not take off if weather is stormy" do
      airport.land(plane)
      airport = Airport.new("LHR", 1, :stormy)
      expect { airport.takeoff(plane) }.to raise_error("Stormy weather: Take off denied")
    end

    it "to take off from the airport it is in" do
      airport.land(plane)
      expect(airport.name).to eq plane.airport.name
      expect(plane.status).to eq :landed

      airport.takeoff(plane)

      expect(airport.hangar).not_to include plane
      expect(plane.status).to eq :flying
      expect(plane.airport).to eq nil
    end

    it "cannot receive takeoff command if already flying" do
      airport = Airport.new("LHR", 1, :sunny)
      airport.land(plane)
      airport.takeoff(plane)

      expect { subject.takeoff(plane) }.to raise_error("Plane already flying")
    end

    it "cannot be in the airport if already flying" do
      airport = Airport.new("LHR", 1, :sunny)
      airport.land(plane)
      airport.takeoff(plane)

      expect(airport.hangar).not_to include plane
    end

  end

  context "TEST: landing and takeoff of multiple planes" do
    subject { Airport.new("LHR", 10, :sunny) }

    it "allows landing of multiple planes " do
      land_multiple_planes(10)
      expect(subject.hangar.size).to be > 0
    end

    it "allows multiple plane takeoff" do
      land_multiple_planes(10)
      takeoff_multiple_planes(5)
      expect(subject.hangar.size).to be > 0
    end

    it "prevents landing if no space" do
      expect { land_multiple_planes(100) }.to raise_error "Landing not possible"
    end
  end

end
