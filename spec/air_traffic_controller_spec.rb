require 'air_traffic_controller'

describe AirTrafficController do
  let(:mockAeroplane) { double :aeroplane }
  let(:mockGroundedAeroplane) { double :aeroplane, status: "grounded" }
  let(:mockAirborneAeroplane) { double :aeroplane, status: "airborne" }
  
  it "checks Airport weather" do
    expect(subject.airport.weather).to eq("clear").or eq "stormy"
  end
  
  it "checks if airport is full" do
    expect(subject.hangar_full?).to eq(true).or eq false
  end

  it "checks if a plane is in the hangar" do
    subject.airport.hangar << mockAeroplane
    expect(subject.hangar_include?(mockAeroplane)).to eq(true)
  end

  it "checks if the weather is stormy" do
    expect(subject.stormy?).to eq(true).or eq(false)
  end

  it "checks a flights status" do
    expect(subject.flight_status(mockAirborneAeroplane)).to eq("grounded").or eq "airborne"
  end

  context "when Airport.weather is 'clear'" do
    before(:each) do
      subject.airport.weather = "clear"
    end

    describe "#land" do
      it "stores planes at its Airport" do
        plane = Aeroplane.new
        subject.land(plane)
        expect(subject.hangar).to include plane
      end

      it "changes planes flight .status to 'grounded'" do
        plane = Aeroplane.new
        subject.land(plane)
        expect(plane.status).to eq "grounded"
      end

      it "prevents a plane from landing if already present" do
        plane = Aeroplane.new
        subject.land(plane)
        expect { subject.land(plane) }.to raise_error "Plane already landed at airport"
      end
    end

    describe "#take_off" do
      it "clears planes from airport" do
        plane = Aeroplane.new
        subject.land(plane)
        subject.take_off(plane)
        expect(subject.hangar).to_not include plane
      end

      it "changes planes .status to 'airborne'" do
        plane = Aeroplane.new("grounded")
        subject.hangar << plane
        subject.take_off(plane)
        expect(plane.status).to eq "airborne"
      end
    end
  end

  context "when Airport.weather is 'stormy'" do
    before(:each) do
      subject.airport.weather = "stormy"
    end

    it "prevents planes from landing" do
      expect { subject.land(mockAeroplane) }.to raise_error "Stormy weather preventing landing"
    end

    it "prevents planes from taking off" do
      subject.hangar << mockAeroplane
      expect { subject.take_off(mockAeroplane) }.to raise_error "Stormy weather preventing take off"
    end
  end
end
