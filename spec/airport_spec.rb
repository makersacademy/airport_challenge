# require_relative '../lib/airport.rb'
require 'airport'

describe Airport do
  subject(:airport) { described_class.new(20) }
  let(:plane) { double :plane }
  
  describe '#land' do

    context 'when weather not stormy' do
      before do
        allow(airport).to receive(:stormy?).and_return false
      end
      
      it 'lands a plane' do
        expect(airport).to respond_to(:land).with(1).argument
      end
    
      it 'no landing when airport is at full capacity' do
        20.times { airport.land(plane) }
        expect { airport.land(plane) }.to raise_error 'Can not land - full capacity!'
      end
    end
  
    context 'when weather stormy' do
      it 'raises an error' do
        allow(airport).to receive(:stormy?).and_return true
        expect { airport.land(plane) }.to raise_error 'Can not land plane in a storm'
      end  
    end  
  end
  
  
  describe '#take-off' do
    it 'allows plane to take off' do
      expect(airport).to respond_to(:take_off).with(1).argument
    end 
  end

end


