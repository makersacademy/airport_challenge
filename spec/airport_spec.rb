require 'airport'
require 'plane'
require 'weather'


describe Airport do
  let(:plane) { double :plane }
  subject(:airport) { described_class.new }

  describe '#new' do
    it "has no planes when inititialized" do
      expect(airport.planes).to eq []
    end
  end
  describe '#land' do
    it 'allows planes to land' do
      expect(airport).to respond_to(:land).with(1).argument
    end
    it "raises an error when it's stormy and a plane tries to land or take_off" do
      airport.stormy = true
      expect { airport.land(plane) }.to raise_error 'Landing not allowed due to the poor weather conditions'
      expect { airport.take_off(plane) }.to raise_error 'Take off not allowed due to the poor weather conditions'
      end
    it 'has a set default' do
      Airport::DEFAULT_CAPACITY.times { airport.land(plane) }
      expect{ airport.land(plane) }.to raise_error 'Plane is full'
    end
  end
  describe '#take_off' do
    it 'allows planes to take_off' do
    expect(airport).to respond_to(:take_off).with(1).argument
    end
  end
  describe '#empty_error' do
      it 'sends a message when there are no planes available' do
        expect{ airport.empty_error }.to raise_error  'No planes available'
    end
  end
end
