require 'Plane'

describe Plane do
    let (:airport) {Airport.new}
    it 'lands at an airport' do
        expect(subject.land(airport)).to eq :landed
    end
end