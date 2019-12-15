require 'plane'

describe Plane do

    it 'confirms that a plane is no longer at the airport' do
        expect(subject.landed?).to be false
    end
end