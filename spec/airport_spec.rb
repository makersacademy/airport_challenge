require 'airport'

describe Airport do
  let(:mockAeroplane) { double :aeroplane }

  before(:each) do
    @airport = Airport.new
  end
  
  it "has either stormy or clear weather" do
    expect(subject.weather).to eq("clear").or eq "stormy"
  end
  
  it "has a default capacity" do
    expect(@airport.capacity). to eq(Airport::DEFAULT_CAPACITY)
  end
  
  it "has a variable .capacity" do
    @airport = Airport.new(500)
    expect(@airport.capacity).to eq 500
  end

  context "when .weather is clear" do
    before(:each) do
      @airport.weather = "clear"
    end

    describe "#land()" do
      it "stores planes in an airport" do
        expect(@airport.land(mockAeroplane)).to include mockAeroplane
      end

      it "raises error if airport is full" do
        Airport::DEFAULT_CAPACITY.times { @airport.land(mockAeroplane) }
        expect { @airport.land(mockAeroplane) }.to raise_error "Airport Full"
      end
    end

    describe "#take_off()" do
      it "clears a plane from the airport" do
        @airport.land(mockAeroplane)
        expect(@airport.take_off(mockAeroplane)).to eq mockAeroplane
      end

      it "will not release planes that aren't in the airport" do
        expect { @airport.take_off("BA344") }.to raise_error "BA344 not in airport"
      end
    end

  end
  
  context "when .weather is 'stormy'" do
    before(:each) do
      @airport.weather = "stormy"
    end

    it "won't #land planes" do      
      expect { @airport.land(mockAeroplane) }.to raise_error "Stormy weather preventing landing"
    end

    it "won't #take_off planes" do
      @airport.plane = mockAeroplane
      expect { @airport.take_off(mockAeroplane) }.to raise_error "Stormy weather preventing take off"
    end
  end
end

describe AirTrafficController do
  let(:mockAeroplane) { double :aeroplane }
  let(:mockGroundedAeroplane) { double :aeroplane, status: "grounded"}
  let(:mockAirborneAeroplane) { double :aeroplane, status: "airborne"}
  
  it "checks Airport weather" do
    expect(subject.airport.weather).to eq("clear").or eq "stormy"
  end
  
  it "checks if airport is full" do
    expect(subject.hangar_full?).to eq(true).or eq false
  end

  it "checks if a plane is in the hangar" do
    subject.airport.weather = "clear"
    subject.airport.land(mockAeroplane)
    expect(subject.hangar_include?(mockAeroplane)).to eq(true)
  end

  it "checks if the weather is stormy" do
    expect(subject.stormy?).to eq(true).or eq(false)
  end

  it "checks a flights status" do
    expect(subject.flight_status(mockAirborneAeroplane)).to eq("grounded").or eq "airborne"
  end
end
