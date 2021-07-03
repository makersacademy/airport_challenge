require 'airport'

describe Airport do
    it 'Allows landing' do
        expect(subject).to respond_to(:land)
    end

    it 'Allows takeoff' do
        expect(subject).to respond_to(:take_off).with(1).argument
    end

    it 'Check that takeoff removes plane from airport' do
        plane = Plane.new
        subject.land(plane)
        subject.take_off(plane)
        expect(subject.plane).to eq(nil)
    end

    it 'Does method to check if plane in airport?' do
        plane = Plane.new
        subject.land(plane)
        subject.take_off(plane)
        expect(subject.in_air?(plane)).to eq(false)
    end
end