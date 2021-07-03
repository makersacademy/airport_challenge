require 'airport'

describe Airport do
    it 'Allows landing' do
        expect(subject).to respond_to(:land)
    end

    it 'Allows takeoff' do
        expect(subject).to respond_to(:take_off).with(1).argument
    end

    it 'Expect takeoff to confirm that taken-off plane leaves' do
        plane = Plane.new
        subject.land(plane)
        subject.take_off(plane)
        expect(subject.plane).to eq(nil)
    end
end