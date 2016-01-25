require "airport"

describe Airport do

  subject(:airport) {described_class.new}
  let(:plane) {double :plane}
  let(:stormy) {double :stormy}
  let(:weather) {double :weather}
  let(:rand_capacity) {20}

  before do
    allow(subject).to receive(:too_stormy?).and_return false
  end

  it "instructs a plane to land" do
    allow(plane).to receive(:land).and_return true
    expect(plane.land).to eq true
  end

  it "confirms if a plane has landed" do
    allow(plane).to receive(:land).and_return true
    expect(airport.land_plane(plane)).to include plane
  end

  it "instructs a plane to take off" do
    allow(plane).to receive(:fly).and_return false
    expect(plane.fly).to eq false
  end

  it "confirms if a plane has taken off" do
    allow(plane).to receive(:fly).and_return false
    expect(airport.planes).to_not include plane
  end

  context 'Default settings' do

    it "has a default capacity" do
      expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it "checks that an airport capacity can be set" do
      expect(Airport.new(rand_capacity).capacity).to eq rand_capacity
    end

  end

  it "stops a plane from landing if the airport is full" do
    allow(plane).to receive(:land).and_return true
    airport.capacity.times { airport.land_plane(plane) }
    expect{airport.land_plane(plane)}.to raise_error("Airport full!")
  end

  context 'stormy weather' do

    it "stops a plane from taking off if there is stormy weather" do
      str_error = "It's too stormy to take off!"
      allow(airport).to receive(:too_stormy?).and_return true
      expect{airport.plane_takes_off(plane)}.to raise_error(str_error)
    end

    it "stops a plane from landing if there is stormy weather" do
      allow(airport).to receive(:too_stormy?).and_return true
      expect{airport.land_plane(plane)}.to raise_error("It's too stormy to land!")
    end

  end

end
