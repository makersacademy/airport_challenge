require 'plane'

describe Plane do
    it 'should say if has left the airport' do
        expect(subject).to respond_to(:takeoffconfirmed?)
    end
    
end