require 'airport'

# my second test - checks if class exists
describe Airport do
    it 'checks if airport exists' do
        expect(subject).to be_a Airport
    end
end 