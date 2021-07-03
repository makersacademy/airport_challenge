require 'airport'

describe Airport do
    it 'Allows landing' do
        expect(subject).to respond_to(:land)
    end
end