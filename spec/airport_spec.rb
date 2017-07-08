require 'airport'

describe Airport do
  subject(:airport) { described_class.new }

  let(:airport)     { Airport.new }
  let(:bigairport)  { Airport.new(10) }
  let(:plane)       { double(:plane, land: nil, takeoff: nil, landed?: false, space: 50, people: [], board: nil, alight: passenger) }
  let(:passenger)   { double(:passenger) }

  describe "#full?" do
    it "responds to .full?" do
      expect(subject).to respond_to(:full?)
    end
  end

  describe "#land" do
    it "responds to .land(plane)" do
      expect(subject).to respond_to(:land).with(1).argument
    end
    it "stores landed planes in @planes array" do
      allow(airport).to receive(:badweather?).and_return false
      airport.land(plane)
      expect(airport.planes).to include plane
    end
  end

  describe "#badweather?" do
    it "responds to .badweather? with true/false" do
      allow(airport).to receive(:badweather?).and_return false
      expect(subject.badweather?).to eq false
      allow(airport).to receive(:badweather?).and_return true
      expect(subject.badweather?).to eq true
    end
    it "stops planes landing in bad weather" do
      allow(airport).to receive(:badweather?).and_return true
      expect { airport.land(plane) }.to raise_error("Bad weather stops planes landing!")
    end
    it "stops planes taking off in bad weather" do
      allow(airport).to receive(:badweather?).and_return false
      airport.land(plane)
      allow(airport).to receive(:badweather?).and_return true
      expect { airport.takeoff(plane) }.to raise_error("Bad weather stops planes taking off!")
    end
  end

  describe "#takeoff" do
    it "responds to .takeoff(plane)" do
      allow(airport).to receive(:badweather?).and_return false
      expect(subject).to respond_to(:takeoff).with(1).argument
    end
    it "returns correct plane after takeoff" do
      allow(airport).to receive(:badweather?).and_return false
      airport.land(plane)
      expect(airport.takeoff(plane)).to eq plane
    end
  end

  describe "#board" do
    it "responds to .board(plane)" do
      expect(subject).to respond_to(:board).with(1).argument
    end
    it "won't allow planes to board passengers when not at the current airport" do
      expect { airport.board(plane) }.to raise_error(RuntimeError)
    end
  end

  describe "#alight" do
    it "responds to .alight(plane)" do
      expect(subject).to respond_to(:alight).with(1).argument
    end
    it "won't allow planes to alight when not at the current airport" do
      expect { airport.alight(plane) }.to raise_error(RuntimeError)
    end
  end

  describe "initialisation" do
    it "can take an argument at creation to set capacity" do
      expect(bigairport.capacity).to eq 10
    end
  end
end
