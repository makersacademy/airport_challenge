require './lib/airport'
require './lib/plane'

describe Airport do
    let(:airport) {Airport.new}
    let(:plane) {Plane.new}
    it 'exists' do
        expect(airport).to be_instance_of(Airport)
    end
    it 'responds to #land' do
    expect(airport).to respond_to(:land)
    end
    it 'is waiting at the airport after landing' do
        expect(airport.land(plane)).to include(plane)
    end
    it 'responds to #take_off' do
        expect(airport).to respond_to(:take_off)
    end
    it 'leaves the airport and finally take off, see you soon!' do
        expect(airport.take_off(plane)).not_to include(plane)
    end
end