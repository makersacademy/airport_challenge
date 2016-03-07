require 'airport'
require 'plane'

describe Airport do
  subject(:airport) {described_class.new}
  let(:plane) { double(:plane) }

  # before do
  #   allow(plane).to receive(:landed?)
  #   allow(airport).to receive(:storm?).and_return(false)
  # end

  describe '#initialization' do
    it 'defaults capacity' do
      expect(subject.capacity).to eq 100
    end

    it "accepts a given capacity" do
      airport = Airport.new(100)
      allow(airport).to receive(:storm?).and_return(false)
      100.times { airport.instruct_land(Plane.new) }
      expect{ airport.instruct_land(plane) }.to raise_error "Airport full."
    end
  end


    it { is_expected.to respond_to(:instruct_land).with(1).argument }

    describe '#landing' do
      it "instructs plane to land" do
        allow(airport).to receive(:storm?).and_return(false)
        plane = Plane.new
        airport.instruct_land(plane)
        expect(airport.planes.last).to eq plane
      end

      it "confirms plane has landed" do
        allow(airport).to receive(:storm?).and_return(false)
        expect(plane).to receive(:landed?)
        airport.instruct_land(plane)
      end

      it "raises an error if airport is full" do
        allow(airport).to receive(:storm?).and_return(false)
        airport.capacity.times { airport.instruct_land(Plane.new) }
        expect { airport.instruct_land(plane) }.to raise_error "Airport full."
      end

      it "raises an error if there is a storm during landing" do
        allow(airport).to receive(:storm?).and_return(true)
        plane = Plane.new
        expect { airport.instruct_land(plane).to raise_error "Storm." }
      end
    end

    it { is_expected.to respond_to(:instruct_takeoff).with(1).argument }

    describe '#takeoff' do
      it "instructs plane to take off" do
        allow(airport).to receive(:storm?).and_return(false)
        plane = Plane.new
        airport.instruct_land(plane)
        airport.instruct_takeoff(plane)
        expect(plane.landed).to eq false
      end

      it "confirms plane has taken off" do
        allow(airport).to receive(:storm?).and_return(false)
        plane = Plane.new
        airport.instruct_land(plane)
        airport.instruct_takeoff(plane)
        expect(airport.planes.include?(plane)).to eq false
      end

      it "raises an error if airport is empty" do
        plane = Plane.new
        expect { airport.instruct_takeoff(plane) }.to raise_error "Airport empty."
      end

      it "raises an error if there is a storm during takeoff" do
        allow(airport).to receive(:storm?).and_return(true)
        plane = Plane.new
        airport.planes << plane
        expect { airport.instruct_takeoff.to raise_error "Storm." }
      end
    end
end
