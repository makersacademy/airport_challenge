require 'plane'
require 'airport'

describe Plane do
    it { is_expected.to respond_to(:land).with(1).argument }
    it { is_expected.to respond_to(:take_off).with(1).argument }

    it 'should land a plane at an airport' do
        airport = Airport.new
        subject.land(airport)
        expect(airport.hangar).to eq([subject])
        end

    it 'should take off from an airport' do
        airport = Airport.new
        subject.land(airport)
        subject.take_off(airport)
        expect(airport.hangar).to eq([subject] - [subject])
        end

end