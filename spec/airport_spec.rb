require 'airport'

describe Airport do
  let(:test_airport) { Airport.new(1) }
  let(:test_airport_2) { Airport.new(1) }
  let(:test_plane) { Plane.new }

  before do
    allow(test_airport).to receive(:stormy?).and_return(false)
  end

  it { is_expected.to respond_to :request_to_land }

  it { is_expected.to respond_to :request_to_take_off }

  it { is_expected.to respond_to :planes }

  it { is_expected.to respond_to :airport_capacity }

  it { is_expected.to respond_to :name }

  describe "#request_to_land" do
    it "lands a plane succesfully and responds with a confirmation - 'Plane has landed.'" do
      expect(test_airport.request_to_land(Plane.new)).to eq "Plane has landed."
    end

    it "cannot land a plane if the airport is full - provides rejection message - 'Plane cannot land, Airport is full.'" do
      test_airport.request_to_land(Plane.new)
      expect(test_airport.request_to_land(Plane.new)).to eq "Plane cannot land, Airport is full."
    end

    it "cannot land a plane if the weather is stormy - provides rejection message" do
      allow(test_airport).to receive(:stormy?).and_return(true)
      expect(test_airport.request_to_land(Plane.new)).to eq "Plane cannot land, it is stormy. Plane to circle."
    end

    it "once a plane has landed, it is stored at the airport" do
      test_airport.request_to_land(test_plane)
      expect(test_airport.planes.include?(test_plane)).to eq true
    end

    it "cannot land a plane that has already landed at the airport" do
      test_airport.request_to_land(test_plane)
      expect(test_airport.request_to_land(test_plane)).to eq "Plane has already landed at this airport."
    end
  end

  describe "#request_to_take_off" do
    before do
      test_airport.request_to_land(test_plane)
    end

    it "takes off a plane succesfully and responds with a confirmation - 'Plane has taken off.'" do
      expect(test_airport.request_to_take_off(test_plane)).to eq "Plane has taken off."
    end

    it "cannot take off a plane if there are no planes available" do
      test_airport.request_to_take_off(test_plane)
      expect(test_airport.request_to_take_off(Plane.new)).to eq "No planes to take off. Have a 5 minute break air control..."
    end

    it "cannot take off a plane if it is stormy - provides confirmation message" do
      allow(test_airport).to receive(:stormy?).and_return(true)
      expect(test_airport.request_to_take_off(test_plane)).to eq "Plane cannot take off, it is stormy. Each passenger gets a £15 WcDonalds Voucher."
    end

    it "cannot take off a plane that is not at the airport" do
      expect(test_airport.request_to_take_off(Plane.new)).to eq "That plane is not at the airport, cannot take off."
    end

    it "once a plane has taken off, it is no longer at the airport" do
      test_airport.request_to_take_off(test_plane)
      expect(test_airport.planes.include?(test_plane)).to eq false
    end
  end

  context "can create alternate capacity airports" do
    it "new airports automatically set to DEFAULT_CAPACITY of 10" do
      expect(subject.airport_capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it "sets an alternative capacity if specified on Airport.new - test capacity of 20" do
      expect(Airport.new(20).airport_capacity).to eq 20
    end

    it "sets an alternative capacity if specified on Airport.new - test capacity of 1" do
      expect(Airport.new(1).airport_capacity).to eq 1
    end

    it "does not allow negative or zero capacity airports - resets to DEFAULT_CAPACITY if a non-positive number is specified" do
      expect(Airport.new(0).airport_capacity).to eq Airport::DEFAULT_CAPACITY
      expect(Airport.new(-20).airport_capacity).to eq Airport::DEFAULT_CAPACITY
    end
  end

  context "tests with two airports" do
    before do
      test_airport.request_to_land(test_plane)
      test_airport_2.request_to_land(Plane.new)
    end

    it "does not allow a plane to land at airport_2 if it is already landed at airport_1" do
      expect(test_airport_2.request_to_land(test_plane)).to eq "Plane has already landed at another airport."
    end

    it "does not allow a plane to take off from airport_2 if it is at airport_1" do
      expect(test_airport_2.request_to_take_off(test_plane)).to eq "That plane is not at the airport, cannot take off."
    end
  end

  context "Airports can be named, defaults to 'test_airport'" do
    it { expect(subject.name).to eq "test_airport" }
    it { expect(Airport.new(50, "Heathrow").name).to eq "Heathrow" }
  end

end
