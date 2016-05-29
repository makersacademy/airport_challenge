require 'airport'

describe Airport do

  let(:airport) { Airport.new }
  let(:plane) { double :plane, land: nil, depart: nil }

  describe 'respond and initiate' do
    it "responds to a method" do
      expect(airport).to respond_to(:land).with(1).argument
      expect(airport).to respond_to(:depart).with(1).argument
    end

    it "can initialize a new airport" do
      expect(airport).to be_a(Airport)
    end

    it "has a default capacity" do
      expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
    end
  end


  describe '#land' do

    it "raises an error when airport is full" do
      Airport::DEFAULT_CAPACITY.times { airport.land(plane) }
      expect { airport.land(plane) }.to raise_error "Airport is full"
    end
  end

  describe '#depart' do
    it 'raises an error when there are no planes to depart' do
      expect { airport.depart(plane) }.to raise_error "No planes at airport"
    end
  end
end
