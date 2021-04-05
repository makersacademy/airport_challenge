require 'airport'
require 'plane'

describe 'Airport' do
  subject(:airport) { Airport.new }
  let(:plane) { Plane.new }

  it "has a default capacity which can be changed as required" do
    airport.capacity = 20
    expect(airport.capacity).to eq(20)
  end
  
  describe 'conditions for #land' do

    context 'when weather stormy' do
      before do
        allow(airport).to receive(:stormy?).and_return false
      end

      it "allows airport to accept landing plane" do
        allow(airport).to receive(:land)
        airport.hangar << plane
        expect(airport.hangar).to include(plane)
      end
    
      context 'when airport hangar is full' do
        it "raises an error" do
          20.times { airport.land(plane) }
          expect { airport.land(plane) }.to raise_error 'Error: Cannot land plane, hangar is full' 
        end
      end
    end

    context 'when weather is stormy' do
      it 'raises an error' do
        allow(airport).to receive(:stormy?).and_return true
        expect { airport.land(plane) }.to raise_error 'Error: Cannot land plane, weather is stormy' 
      end
    end

  end
  
  describe 'conditions for #take_off' do
    context 'when not stormy' do
      before do
        allow(airport).to receive(:stormy?).and_return false
      end
      it 'allows planes to take off from airport' do
        allow(airport).to receive(:take_off)
        airport.hangar << plane
        airport.hangar.delete(plane)
        expect(airport.hangar).not_to include(plane)
      end
      context 'when airport hangar is empty' do
        it "raises an error" do
          expect { airport.take_off(plane) }.to raise_error 'Error: Plane cannot take off, hangar is empty' 
        end
      end
    end

    context 'when weather is stormy' do
      it 'raises an error' do
        allow(airport).to receive(:stormy?).and_return true
        airport.hangar << plane
        expect { airport.take_off(plane) }.to raise_error 'Error: Plane cannot take off, weather is stormy' 
      end
    end
  end
end
