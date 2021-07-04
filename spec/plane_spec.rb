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

    it 'should let a plane take off from an airport' do
        airport = Airport.new
        subject.land(airport)
        subject.take_off(airport)
        expect(airport.hangar).to eq([subject] - [subject])
        end
    describe '#take_off' do
        it 'should confirm that the plane has left the airport' do
            airport = Airport.new
            subject.land(airport)
            subject.take_off(airport)
            expect("#{subject} has left the #{airport}")
        end
    end
end