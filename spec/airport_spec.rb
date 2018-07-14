require 'airport'
require 'plane'

describe Airport do
    subject(:airport) {described_class.new}

    it 'is expected to respond to the method "land" with 1 argument' do
        expect(airport).to respond_to(:land).with(1).argument
    end

end