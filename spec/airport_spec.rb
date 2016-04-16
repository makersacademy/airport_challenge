require 'airport'

describe Airport do

let(:airport) { subject }
let(:plane) { double(:plane, land: nil, take_off: nil) }

  context 'When weather is not stormy' do

    context 'when a plane trying to land' do

      it 'instruct the plane to land' do
        expect(plane).to receive(:land)
        airport.land(plane)
      end

      it 'confirm the plane has landed' do
        airport.land(plane)
        expect(airport.hangar).to include plane
      end

    end

    context 'when a plane trying to taking off' do

      it 'instruct the plane to take off' do
        airport.land(plane)
        expect(plane).to receive(:take_off)
        airport.take_off(plane)
      end

      it 'confirm the plane has left' do
        airport.land(plane)
        airport.take_off(plane)
        expect(airport.hangar).not_to include plane
      end

    end

  end

end
