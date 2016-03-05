require 'airport'
require 'plane'

describe Airport do
  subject(:airport) {described_class.new}
  let(:plane) { double(:plane) }

  before do
    allow(plane).to receive(:landed?)
    allow(plane).to receive(:landed).and_return(false)
  end

  describe '#initialization' do
    subject { Airport.new }
    it 'defaults capacity' do
      described_class::DEFAULT_CAPACITY.times do
        airport.instruct_land(plane)
      end
      expect { airport.instruct_land(plane) }.to raise_error "Airport full."
    end

    it "accepts a given capacity" do
      airport = Airport.new(100)
      100.times { airport.instruct_land (plane) }
      expect{ airport.instruct_land (plane)}.to raise_error "Airport full."
    end
  end


  it { is_expected.to respond_to(:instruct_land).with(1).argument }

  describe '#landing' do
    it "instructs plane to land" do
      airport.instruct_land(plane)
      expect(airport.planes.last).to eq plane
    end

    it 'confirm plane has landed' do
      expect(plane).to receive(:landed?)
      airport.instruct_land(plane)
    end

    it "raises an error if airport is full" do
      airport.capacity.times { airport.instruct_land(plane) }
      expect { airport.instruct_land(plane) }.to raise_error "Airport full."
    end
  end

  it { is_expected.to respond_to(:instruct_takeoff) }

  describe '#takeoff' do
    it "instructs plane to take off" do
      plane = Plane.new
      airport.planes << plane
      airport.instruct_takeoff
      expect(plane.landed).to eq false
    end

    it "confirm plane has taken off" do
      plane = Plane.new
      airport.planes << plane
      airport.instruct_takeoff
      expect(airport.planes.include?(plane)).to eq false
    end
  end


end
