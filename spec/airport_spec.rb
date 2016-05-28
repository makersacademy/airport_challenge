require 'airport'
require 'plane'

describe Airport do

  let(:airport) { Airport.new }

  describe 'respond and initiate' do
    it "responds to a method"do
      expect(airport).to respond_to(:land_aircraft).with(1).argument
      expect(airport).to respond_to(:allow_departure).with(1).argument
    end

    it "can initialize a new airport" do
      expect(airport).to be_a(Airport)
    end

    it "has a default capacity" do
      expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
    end

  end

  describe '#land_aircraft' do
    it "raises an error when airport is full" do
      Airport::DEFAULT_CAPACITY.times { airport.land_aircraft(Plane.new) }
      expect { airport.land_aircraft(Plane.new) }.to raise_error "Airport is full"
    end

    

  end

  describe '#allow_departure' do
    it 'raises an error when there are no planes to depart' do
      expect { airport.allow_departure(Plane.new) }.to raise_error "No planes at airport"
    end
  end





end
