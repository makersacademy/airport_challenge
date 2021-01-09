require 'airport'

describe Airport do

    it 'should respond to land' do
        expect(Airport.new).to respond_to(:land).with(1).argument
    end

    it 'should repond to take_off' do
        expect(Airport.new).to respond_to(:take_off).with(1).argument
    end
end
