require 'airport'

describe Airport do
  subject(:airport) {described_class.new}
  let(:plane) {Plane.new}
  let(:qantas) {Plane.new}
  let(:singapore) {Plane.new}
  #let(:plane) {Plane.new}

  it "an Airport instance will have an attribute of capacity set to a default" do
    Airport = Struct.new(:capacity)
    airport = Airport.new(20)
    expect(airport).to have_attributes(:capacity => 20)
  end

  describe "#landing" do
    it "responds with 1 argument to landing" do
      expect(airport).to respond_to(:landing).with(1).argument
    end

  it "airport stores plane that has landed" do
    expect(airport.landing(plane)).to include(plane)
  end

  it "airport prevent plane from landing in airport (@plane array) if the weather is stormy" do
    allow(airport). to receive(:stormy?) {true}
    expect(airport.landing(qantas)).not_to include(qantas)
  end

  it "airport prevent plane from landing in airport (@plane array) if full" do
    airport.landing(Plane.new)
    airport.landing(Plane.new)
    expect(airport.landing(singapore)).not_to include(singapore)
  end

  it "airport won't let planes land if they are already in airport" do
    airport.landing(singapore)
    #expect { airport.landing(singapore) }.to raise_error "plane is aleady landed"
  end

end

    #allow(airport). to receive(:) {true}
    #expect(airport.landing(plane)).not_to include(plane)




  describe "#take_off" do
    it "responds to take_off with one argument " do
      expect(airport).to respond_to(:take_off).with(1).argument
    end
    it "Plane is no longer in airport (@planes)" do
      airport.landing(plane)
      expect(airport.take_off(plane)).not_to include(plane)
    end
    it "outputs message to confirm plane is no longer in airport (@planes)" do
      expect{airport.take_off(plane)}. to output("plane gone\n").to_stdout
    end
    it "airport prevent plane from taking off from airport (@plane array) if the weather is stormy" do
      airport.landing(plane)
      allow(airport). to receive(:stormy?) {true}
      expect(airport.take_off(plane)).to include(plane)
    end

  end


  describe "#stormy" do
    it "returns true if weather is 'stormy' " do
      allow(airport). to receive(:stormy?) {"stormy"}
      expect(airport).to be_stormy
    end
  end

  describe "#full?" do

    it "returns true if airport is full" do
      airport.landing(Plane.new)
      airport.landing(Plane.new)
      expect(airport).to be_full
    end
  end

end
