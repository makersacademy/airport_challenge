# require_relative '../lib/airport.rb'
require 'airport'
require 'weather'

describe Airport do
  subject(:airport) { described_class.new(20) }
  let(:plane) { double :plane }
  
  describe '#land' do

    context 'when weather is not stormy' do
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
  
    context 'when weather is stormy' do
      it 'raises an error' do
        allow(airport).to receive(:stormy?).and_return true
        expect { airport.land(plane) }.to raise_error 'Can not land plane in a storm'
      end  
    end  
  end
  
  
  describe '#take-off' do
    context 'when weather is not stormy'
      it 'allows plane to take off' do
        expect(airport).to respond_to(:take_off).with(1).argument
      end 
    
    context 'when weather is stormy'
      before do
        allow(airport).to receive(:stormy?).and_return true
      end
      
      it 'raises an error' do
        expect { airport.take_off(plane) }.to raise_error 'Can not take-off in a storm'
      end
    end

end


