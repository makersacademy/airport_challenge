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
    let(:plane) { double :plane }

    it "allows planes to land" do
      expect(airport.land(plane)).to eq plane
    end

    it "contains the plane after landing" do
      airport.land(plane)
      expect(airport.planes).to include plane
    end

    it "fails if airport is full" do
      airport.capacity.times do
        airport.land(plane)
      end
      expect{airport.land(plane)}.to raise_error("airport full")
    end


  end



end
