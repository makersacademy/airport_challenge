require 'plane'

describe Plane do
    it 'Confirms plane is flying' do
        expect(subject).to respond_to :flying    
    end
end    