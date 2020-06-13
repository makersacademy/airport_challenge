require('airport')

describe 'airport' do
    it 'creates a new class of airport' do
        expect(Airport.new).to be_an_instance_of(Airport)
    end
end