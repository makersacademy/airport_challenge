require 'airport'

describe Airport do

  subject(:airport) { described_class.new }
  let (:plane) { double :plane }
  let (:weather) { double :weather }

  before { allow(airport.weather).to receive(:storm?).and_return(false) }

  describe "#land" do
    it { is_expected.to respond_to(:land).with(1).argument }
  end

  it "checks that a landed plane is in the airport" do
    airport.land(plane)
    expect(airport.planes[0]).to eq plane
  end

  it "check that a plane has left the aiport after take off" do
    airport.land(plane)
    airport.take_off(plane)
    expect(airport.planes.empty?).to eq true
  end

  it "raise an error if plane tries to take off when there is a storm" do
    airport.land(plane)
    allow(airport.weather).to receive(:storm?).and_return(true)
    expect { airport.take_off(plane) }.to raise_error "plane cannot take off due to a storm"
  end

  it "raise an error if plane tries to land when there is a storm" do
    allow(airport.weather).to receive(:storm?).and_return(true)
    expect { airport.land(plane) }.to raise_error "plane cannot land due to a storm"
  end

  it "raise error when plane attempts landing at full airport " do
    50.times { airport.land(Plane.new) }
    expect { airport.land(plane) }.to raise_error("the airport is currently full")
  end

  it "raise error if plane is asked to take off but is not at the airport" do
    expect { airport.take_off(plane) }.to raise_error("plane not currently at airport")
  end

  it "should raise error if plane tries to land but is already in airport" do
    airport.land(plane)
    expect { airport.land(plane) }.to raise_error("plane has already landed")
  end

  # rspec feature test
  it "creates three planes which land and take off at unique airports" do
    # create aiports
    heathrow = Airport.new(10)
    gatwick = Airport.new(25)
    stansted = Airport.new(5)

    # ensure weather is peachy
    allow(heathrow).to receive_message_chain(:weather, :storm?) { false }
    allow(gatwick).to receive_message_chain(:weather, :storm?) { false }
    allow(stansted).to receive_message_chain(:weather, :storm?) { false }

    # create planes
    boeing_747 = Plane.new
    airbus_a380 = Plane.new
    bombardier_crj200 = Plane.new

    # land planes
    heathrow.land(boeing_747)
    gatwick.land(airbus_a380)
    stansted.land(bombardier_crj200)

    # checks all planes have landed
    expect(heathrow.planes[0]).to eq boeing_747
    expect(gatwick.planes[0]).to eq airbus_a380
    expect(stansted.planes[0]).to eq bombardier_crj200

    # all planes take off
    heathrow.take_off(boeing_747)
    gatwick.take_off(airbus_a380)
    stansted.take_off(bombardier_crj200)

    # check all airports are empty
    expect(heathrow.planes.empty?).to eq true
    expect(gatwick.planes.empty?).to eq true
    expect(stansted.planes.empty?).to eq true
  end

  describe "initialization" do
    it "checks default aiport capacity" do
      described_class::DEFAULT_CAPACITY.times do
        airport.land(Plane.new)
      end
      expect { airport.land(Plane.new) }.to raise_error "the airport is currently full"
    end
  end

  describe "initialization" do
    airport = Airport.new(35)
    it "checks custom airport capacity of 35" do
      allow(airport.weather).to receive(:storm?).and_return(false)
      airport.capacity.times do
        airport.land(Plane.new)
      end
      expect { airport.land(Plane.new) }.to raise_error "the airport is currently full"
    end
  end
end
