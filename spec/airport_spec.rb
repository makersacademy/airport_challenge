require 'airport'

describe Airport do

    it 'allow plane to land at aiport' do
        plane = Plane.new
        expect(subject.land(plane)).to eq [plane]
    end

    it 'allow plane to take-off' do
        plane = Plane.new
        subject.land(plane)
        expect(subject.take_off(plane)).to eq plane
    end

    it 'prevents planes from landing if airport full' do
        plane = Plane.new
        20.times { subject.land(plane) }
        expect { subject.land(plane) }.to raise_error "Airport is full"
    end
end