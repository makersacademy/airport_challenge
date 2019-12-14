require 'airport'

describe Airport do
    it 'allow plane to take-off' do
        expect(subject.take_off).to be true
    end
end