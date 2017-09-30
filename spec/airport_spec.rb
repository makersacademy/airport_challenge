require 'airport'
require 'aeroplane'
require 'weather'

describe Airport do

  let(:subject)   { Airport.new }
  let(:plane)     { Aeroplane.new }
  let(:weather)   { Weather.new }

  it 'has a default capacity of 10' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  describe 'take_off(plane)' do
    it 'allows a plane to take off' do
      subject.land(plane)
      subject.take_off(plane)
      expect(plane.landed).to be false
    end
    # it 'raises a stormy weather error' do
    #   weather.stormy?
    #   expect { subject.take_off(plane) }.to raise_error 'Plane cannot take off due to storm'
    # end
    it 'will not release a plane when airport is empty' do
      expect { subject.take_off(plane) }.to raise_error 'Airport empty!'
    end
  end

  describe 'land' do
    it 'allows a plane to land in the airport' do
      subject.land(plane)
      expect(plane.landed).to be true
    end
    it 'will not allow planes to land when airport is full' do
      Airport::DEFAULT_CAPACITY.times { subject.land(Aeroplane.new) }
      expect { subject.land(Aeroplane.new) }.to raise_error 'Airport full!'
    end
  end


end
