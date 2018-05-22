require "airport"

describe Airport do
  subject(:airport) { described_class.new(Airport::DEFAULT_CAPACITY) }
  subject(:plane) { Plane.new }


  context "#take_off" do

    it "prevents take_off if the weather is stormy" do
      allow(airport).to receive(:stormy?).and_return true
      expect { airport.take_off(plane) }.to raise_error ' Weather is stormy - cannot take_off! '
    end

    before { allow(airport).to receive(:stormy?).and_return false }

    it "responds to #take_off" do
      expect(airport).to respond_to(:take_off).with(1).argument
    end

    it "instructs a plane to take_off and checks if it has" do
      airport.land(plane)
      expect(airport.take_off(plane)).to eq plane
    end

    it "prevents planes from taking off from other airports except the one they are in" do
      expect { airport.take_off(plane) }.to raise_error ' The plane is not at the current airport '
    end
  end


  context "#land" do

    it "prevents landing when the weather is stormy" do
      allow(airport).to receive(:stormy?).and_return true
      expect { airport.land(plane) }.to raise_error ' Weather is stormy - cannot land! '
    end

    before { allow(airport).to receive(:stormy?).and_return false }

    it "responds to #land" do
      expect(airport).to respond_to(:land).with(1).argument
    end

    it "prevents the plane to land when the airport is full" do
      20.times { airport.land(Plane.new) }
      expect { airport.land(Plane.new) }.to raise_error ' Airport is full - cannot land '
    end

    it "prevents planes from landing after they have already landed" do
      airport.land(plane)
      expect { airport.land(plane) }.to raise_error ' The plane has already landed '
    end
  end


  context "#initialize" do
    it 'has a default capacity' do
      expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
    end
  end

end
