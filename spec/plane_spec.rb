require 'airport'

describe Plane do
    it {is_expected.to respond_to(:landed?)}
    
    describe 'Landed' do
        it 'should report that it has landed' do
            expect(subject.landed?).to be_truthy
        end
    end
end