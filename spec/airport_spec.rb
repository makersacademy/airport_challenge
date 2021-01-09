require 'airport'

describe Airport do

    it 'should respond to land' do
        expect(Airport.new).to respond_to(:land).with(1).argument
    end

    it 'reports plane in airport' do
        plane = Plane.new
        expect(subject.land(plane)).to eq plane
    end

    it 'should repond to take_off' do
        expect(Airport.new).to respond_to(:take_off).with(1).argument
    end
end
