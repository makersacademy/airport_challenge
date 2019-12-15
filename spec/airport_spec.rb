require 'airport'

describe Airport do

    let (:plane) { double :plane }

    it 'allow plane to land at aiport' do
        expect(subject.land(plane)).to eq [plane]
    end

    it 'allow plane to take-off' do
        subject.land(plane)
        expect(subject.take_off(plane)).to eq plane
    end

    it 'prevents planes from landing if airport full' do
        subject.capacity.times { subject.land(plane) }
        expect { subject.land(plane) }.to raise_error "Airport is full"
    end
end