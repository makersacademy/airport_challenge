require 'airport'
require 'plane'

describe Plane do
    let(:airport) { Airport.new }

    it 'checks whether a particular plane has departed from airport' do
        airport.land(subject)
        expect(airport.take_off(subject)).to eq(subject)
    end

    it 'checks whether a plane instance has departed' do
        expect(subject).to respond_to(:departed?)
    end
end