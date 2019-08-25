require 'airport'
require 'plane'

describe 'Plane' do
    let(:airport) { Airport.new }

    it 'checks whether a plane has departed' do
        expect(airport.take_off(subject)).to eq(subject)
        expect(subject).to respond_to(:departed?)
    end

end