require 'airport'

describe Airport do
  subject(:airport) { described_class.new }

  describe '#initialize' do

    it 'has a default capacity' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it 'can set capacity' do
      capacity = 5
      airport = described_class.new(capacity)
      expect(airport.capacity).to eq capacity
    end

  end

  describe '#land' do
    let(:plane) { double :Plane }
    # how do I put the allow phrase in the let?
    # or the double in the before?
    before do
      allow(plane).to receive(:land)
    end

    context "normal weather" do
      let(:normal_weather) { double 'Weather' }
      before do
        allow(normal_weather).to receive(:stormy?) { false }
        # airport = described_class.new(weather: normal_weather)
      end

      it "allows planes to land" do
        airport = described_class.new(weather: normal_weather)
        expect(airport.land(plane)).to eq plane
      end

      it "instructs the plane to land" do
        airport = described_class.new(weather: normal_weather)
        expect(plane).to receive(:land)
        airport.land(plane)
      end

      it "contains the plane after landing" do
        airport = described_class.new(weather: normal_weather)
        airport.land(plane)
        expect(airport.planes).to include plane
      end

      it "fails if airport is full" do
        airport = described_class.new(weather: normal_weather)
        airport.capacity.times do
          airport.land(plane)
        end
        expect { airport.land(plane) }.to raise_error("airport full")
      end

    end

    context "stormy weather" do
      # UNDERSTAND THIS
      let(:stormy_weather) { double :Weather }

      before(:each) do
        # stormy_weather = double('Weather')
        allow(stormy_weather).to receive(:stormy?) { true }

      end

      it "cannot land when stormy" do
        airport = described_class.new(weather: stormy_weather)
        expect { airport.land(plane) }.to raise_error("cannot land when stormy")

      end

    end

  end

  describe "#take_off" do
    let(:plane) { double :Plane }
    # how do I put the allow phrase in the let?
    # or the double in the before?
    before do
      allow(plane).to receive(:land)
      allow(plane).to receive(:take_off)
    end

    context "normal weather" do
      let(:normal_weather) { double 'Weather' }
      before do
        allow(normal_weather).to receive(:stormy?) { false }
      end

      it "instructs the plane to take off" do
        airport = described_class.new(weather: normal_weather)
        airport.land(plane)
        expect(plane).to receive(:take_off)
        airport.take_off(plane)
      end

      it "fails if plane not in airport" do
        airport = described_class.new(weather: normal_weather)
        expect { airport.take_off(plane) }.to raise_error "plane not at this airport"
      end

      it "confirm that plane leaves the airport" do
        airport = described_class.new(weather: normal_weather)
        airport.land(plane)
        airport.take_off(plane)
        expect(airport.planes).not_to include(plane)
      end

    end

    context "stormy weather" do
      let(:stormy_weather) { double 'Weather' }
      before do
        allow(stormy_weather).to receive(:stormy?) { true }
      end

      it "cannot take off when stormy" do
        airport = described_class.new(weather: stormy_weather)
        airport.instance_variable_set(:@planes, [plane])
        expect { airport.take_off(plane) }.to raise_error "cannot take off when stormy"
      end

    end

  end

end
