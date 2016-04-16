require 'airport'

describe Airport do

let(:airport) { subject }
let(:plane) { double(:plane, land: nil, take_off: nil) }
let(:weather) { double(:weather) }

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

  context 'When the whether is stormy' do

    context 'when a plane trying to land' do

      it 'raise an error' do
        allow(weather).to receive(:stormy?).and_return true
        expect{airport.land(plane)}.to raise_error 'Stormy weather! Do not land!'
      end

      it 'does not let the plane land' do
        allow(weather).to receive(:stormy?).and_return true
        airport.land(plane)
        expect(airport.hangar).not_to include plane
      end

    end

  end


end
