require 'plane'

describe Plane do
    subject(:plane) { described_class.new }
    # it 'should be stated as in hangar when it begins' do
    #     expect(plane.airport).to eq true
    # end
    # now an obsolete state test
    describe '#landed?' do
        it 'should respond to the method landed?' do
            expect(plane).to respond_to(:landed?)
        end
        it 'should return true or false if a plane is in an airport' do
            expect(plane.landed?).to eq plane.airport
        end
    end
end
