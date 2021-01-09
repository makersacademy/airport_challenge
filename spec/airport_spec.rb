require 'airport'

describe Airport do

    it 'should respond to land' do
        expect(Airport.new).to respond_to(:land)
    end

end
