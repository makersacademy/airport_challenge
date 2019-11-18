require 'airport'
require 'plane'
require 'weather'

# look at "should override default airport capacity upon creation"  (line ~70)

describe Airport do

  let(:plane) { double(:plane) }

  let(:weather) { double(:weather) }

  subject(:airport) { described_class.new(weather: weather) }

  context "in sunny weather" do
    before(:each) do
      allow(weather).to receive(:stormy?).and_return(false)
      allow(plane).to receive(:land)
      allow(plane).to receive(:take_off)
    end

    describe "#land" do

      it "should land the plane at the airport" do
        allow(weather).to receive(:stormy?).and_return(false)
        allow(plane).to receive(:flying?).and_return(true)
        expect(airport.land(plane)).to eq "Plane has been landed"
      end

      it "should not land when the plane is already landed" do
        allow(plane).to receive(:flying?).and_return(false)
        expect { airport.land(plane) }.to raise_error "That plane is already on land"
      end

    end

    describe "#take_off" do

      it "should have the plane take off from the airport" do
        allow(plane).to receive(:flying?).and_return(true, false)
        airport.land(plane)
        expect(airport.take_off(plane)).to eq "Plane has taken off"
      end

      it "should prevent takeoff if the plane is not in the airport" do
        airport_2 = Airport.new(weather: weather)
        allow(plane).to receive(:flying?).and_return(true, false)
        airport_2.land(plane)
        expect { airport.take_off(plane) }.to raise_error "That plane is in a different airport"
      end

      it "should prevent takeoff if the plane is already flying" do
        allow(plane).to receive(:flying?).and_return(true)
        expect { airport.take_off(plane) }.to raise_error "That plane is in flight"
      end

    end

    describe "initialize" do

      it "should set default airport capacity" do
        allow(plane).to receive(:flying?).and_return(true)
        Airport::DEFAULT_CAPACITY.times { airport.land(plane) }
        expect { airport.land(plane) }.to raise_error "That airport is full, cannot land"
      end

      it "should override default airport capacity upon creation" do
        allow(plane).to receive(:flying?).and_return(true)
        override_capacity = 10
        # subject(:airport) { described_class.new(capacity: override_capacity, weather: weather) }
        airport = Airport.new(capacity: override_capacity, weather: weather)
        override_capacity.times { airport.land(plane) }
        expect { airport.land(plane) }.to raise_error "That airport is full, cannot land"
      end

    end

    describe "#capacity" do

      it "should override default airport capacity at any point after creation" do
        allow(plane).to receive(:flying?).and_return(true)
        airport.capacity = 5
        5.times { airport.land(plane) }
        expect { airport.land(plane) }.to raise_error "That airport is full, cannot land"
      end

    end

  end

  context "in stormy weather" do
      before(:each) do
        allow(weather).to receive(:stormy?).and_return(true)
        allow(plane).to receive(:land)
        allow(plane).to receive(:take_off)
        allow(plane).to receive(:flying?)
      end

      describe "#land" do

        it "should prevent landing when the weather is stormy" do
          allow(plane).to receive(:flying?).and_return(true)
          expect { airport.land(plane) }.to raise_error "Weather is stormy, cannot land"
        end

      end

      describe "#take_off" do

        it "should prevent takeoff when the weather is stormy" do
          allow(weather).to receive(:stormy?).and_return(false, true)
          allow(plane).to receive(:flying?).and_return(true, false)
          airport.land(plane)
          expect { airport.take_off(plane) }.to raise_error "Weather is stormy, cannot takeoff"
        end

      end

    end

end
