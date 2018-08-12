require 'airport'
require 'aeroplane'

describe Airport do
  let(:mockAeroplane) { double :aeroplane }
  
  it "has either stormy or clear weather" do
    expect(subject.weather).to eq("clear").or eq "stormy"
  end
  
  it "has a default capacity" do
    expect(subject.capacity). to eq(Airport::DEFAULT_CAPACITY)
  end
  
  it "has a variable .capacity" do
    subject = Airport.new(500)
    expect(subject.capacity).to eq 500
  end

  describe "#land()" do
    it "stores planes in an airport" do
      expect(subject.land(mockAeroplane)).to include mockAeroplane
    end
  end

  describe "#take_off()" do
    it "clears a plane from the airport" do
      subject.land(mockAeroplane)
      expect(subject.take_off(mockAeroplane)).to eq mockAeroplane
    end

    it "will not release planes that aren't in the airport" do
      expect { subject.take_off("BA344") }.to raise_error "BA344 not in airport"
    end

  end
end

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
