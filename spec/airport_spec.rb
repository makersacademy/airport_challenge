require 'airport'

RSpec.describe Airport do

  describe 'initialization' do
    subject(:airport) { described_class.new }
    let(:plane) { double :plane }
    it 'creates default capacity, prevents planes from landing when full' do
      allow(airport).to receive(:random_forecast) { :fine }
      allow(airport).to receive(:full) { true }
      expect(airport.capacity).to eq 5
      expect { airport.land(plane) }.to raise_error "No space for plane to land"
    end
  end

  describe "#land" do
    let(:plane) { double :plane }
    it "lands the plane at the airport" do
      allow(subject).to receive(:random_forecast) { :fine }
      allow(subject).to receive(:land) { plane }
      expect(subject.land(plane)).to eq plane
    end
  end

  describe "#takeoff" do
    subject(:airport) { described_class.new }
    let(:plane) { double :plane }
    it "allows plane to takeoff and confirms it has left airport" do
      allow(airport).to receive(:random_forecast) { :fine }
      expect(airport.takeoff(plane)).to eq "Plane has taken off"
    end
  end

  describe "plane in airport" do
    subject(:airport) { described_class.new }
    let(:plane) { double :plane }
    it 'has the plane after landing' do
      allow(airport).to receive(:full) { false }
      allow(airport).to receive(:random_forecast) { :fine }
      airport.land(plane)
      expect(airport.planes).to include plane
    end
  end

  describe "#No_land" do
    subject(:airport) { described_class.new }
    let(:plane) { double :plane }
    it "prevents planes from landing in stormy weather" do
      allow(airport).to receive(:full) { false }
      allow(airport).to receive(:random_forecast) { :stormy }
      expect { airport.land(plane) }.to raise_error "Plane cannot land in this weather"
    end
  end

  describe "#No_takeoff" do
    let(:plane) { double :plane }
    it "prevents planes from taking off in stormy weather" do
      allow(subject).to receive(:random_forecast) { :stormy }
      expect { subject.takeoff(plane) }.to raise_error "Plane cannot take off in this weather"
    end
  end
end
