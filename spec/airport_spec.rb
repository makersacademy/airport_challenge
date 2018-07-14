require 'airport'
describe Airport do
    it 'is expected to respond to the method "land" with 1 argument' do
        is_expected.to respond_to(:land).with(1).argument
    end


end