require 'plane'

describe Plane do
    subject(:plane) { described_class.new }
    it 'should be stated as in hangar when it begins' do
        expect(plane.airport).to eq true
    end
end
