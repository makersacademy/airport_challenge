require 'airport'
require 'plane'

describe Airport do
  
  subject(:airport) { described_class.new(50)}
  let( :plane) {double :plane}

  describe '#land' do

    it 'responds to land' do
    expect(airport).to respond_to(:land).with(1).argument
    end

    it 'prevents landing when airport is full' do
      allow(airport).to receive(:stormy?).and_return false
      50.times do
        airport.land(plane)
    end
      expect { airport.land(plane)}.to raise_error 'airport is full'
    end

    it 'raises error when landing when stormy' do
      allow(airport).to receive(:stormy?).and_return true
      expect { airport.land(plane).to raise_error 'cannot land plane, weather stormy'}
    end

  end

  describe '#take_off' do
    it 'instructs plane to take off from airport' do
    expect(airport).to respond_to(:take_off).with(1).argument
    end

    it 'raises error when taking off when stormy' do
      allow(airport).to receive(:stormy?).and_return true
      expect { airport.take_off(plane).to raise_error 'cannot take off plane, weather stormy'}
    end
  end



  end




  

  