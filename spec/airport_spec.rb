require './lib/airport'

describe Airport do
    subject(:airport) {Airport.new}
    it 'exists' do
        expect(airport).to be_instance_of(Airport)
    end
end