require 'airport'

describe Airport do
  let(:airport) { Airport.new }
  let(:plane) { double :plane }
 
    context 'take off and landing' do
      
      it 'a plane is permitted to land' do
        expect{ airport.receive(plane) }.to change {airport.plane_count}.by(1)
      end

      it 'a plane is permitted to take off' do
        airport = Airport.new
        airport.receive(plane)
        expect{ airport.allow_take_off(plane) }.to change {airport.plane_count}.by(-1)
      end
      
    end

    context 'air traffic control based on capacity' do
      it 'a plane is not permitted to land if airport is at max capacity' do
        allow(plane).to receive(:land).with(airport) 
        40.times{ airport.receive(plane) }
        expect{ airport.receive(plane) }.to raise_error("Airport is at maximum capacity.")
      end 
    end
end

