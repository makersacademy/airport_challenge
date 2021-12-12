require 'Plane'

describe Plane do
    let(:plane) { Plane.new }
    let(:airport) { Airport.new }

    it 'lands at airport' do
        expect(plane). to respond_to('land')
    end

    it 'takes off from the airport' do
        expect(plane). to respond_to('take_off')
    end

end

