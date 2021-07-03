require 'airport'

describe Airport do
    let(:plane) { Plane.new }

    it 'Allows landing' do
        expect(subject).to respond_to(:land)
    end

    it 'Allows takeoff' do
        expect(subject).to respond_to(:take_off).with(1).argument
    end

    it 'Check that takeoff removes plane from airport' do
        subject.land(plane)
        subject.take_off(plane)
        expect(subject.planes).to eq([])
    end

    it 'Does method to check if plane in airport?' do
        subject.land(plane)
        expect(plane.status).to eq('In airport')
        subject.take_off(plane)
        expect(plane.status).to eq('Not in airport')
    end

    it 'Does not let plane land if capacity reached' do
        subject.land(Plane.new)
        expect{ subject.land(Plane.new) }.to raise_error("Airport full.")
    end

    it 'Has a capacity argument that defaults to 1' do
        expect(subject).to respond_to(:take_off).with(1).argument
        a = Airport.new(4)
        expect(a.capacity).to eq(4)
    end

    it 'Only allows planes in airport to takeoff' do
        expect{ subject.take_off(plane) }.to raise_exception("Plane not present")
    end
end