require 'airport'

describe Airport do

  subject(:airport) {described_class.new}
  let(:plane) { double(:plane, landed?: nil, land: nil, takeoff: nil)}

  before do
    allow(airport).to receive(:storm?).and_return(false)
  end

  describe '#initialization' do
    it 'defaults capacity' do
      expect(airport.capacity).to eq 100
    end

    it "accepts a given capacity" do
      airport = Airport.new(100)
      allow(airport).to receive(:storm?).and_return false
      100.times { airport.instruct_land(Plane.new) }
      expect{ airport.instruct_land(plane) }.to raise_error "Airport full."
    end
  end

    describe '#landing' do
      it "instructs plane to land" do
        airport.instruct_land(plane)
        expect(airport.planes.last).to eq plane
      end

      it "confirms plane has landed" do
        airport.instruct_land(plane)
        expect(airport.planes.include?(plane)).to eq true
      end

      it "raises an error if airport is full" do
        airport.capacity.times { airport.instruct_land(plane) }
        expect { airport.instruct_land(plane) }.to raise_error "Airport full."
      end

      it "raises an error if there is a storm during landing" do
        allow(airport).to receive(:storm?).and_return(true)
        expect { airport.instruct_land(plane).to raise_error "Storm." }
      end
    end

    describe '#takeoff' do
      it "instructs plane to take off" do
        allow(plane).to receive(:landed?).and_return(false)
        airport.instruct_land(plane)
        airport.instruct_takeoff(plane)
        expect(plane.landed?).to eq false
      end

      it "confirms plane has taken off" do
        allow(plane).to receive(:landed?).and_return(false)
        airport.instruct_land(plane)
        airport.instruct_takeoff(plane)
        expect(plane.landed?).to eq false
      end

      it "raises an error if airport is empty" do
        message = "Airport empty."
        expect { airport.instruct_takeoff(plane) }.to raise_error message
      end

      it "raises an error if there is a storm during takeoff" do
        allow(airport).to receive(:storm?).and_return(true)
        airport.planes << plane
        expect { airport.instruct_takeoff.to raise_error "Storm." }
      end
    end
end
