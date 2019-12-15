require 'airport'

describe Airport do

    let (:plane) { double :plane }

    describe '#land' do
        it 'allow plane to land at aiport' do
            expect(subject.land(plane)).to eq [plane]
        end

        it 'prevents planes from landing if airport full' do
            subject.capacity.times { subject.land(plane) }
            expect { subject.land(plane) }.to raise_error "Airport is full"
        end
    end

    describe '#take_off' do
        it 'allow plane to take-off' do
            allow(subject).to receive(:weather).and_return("sunny")
            subject.land(plane)
            expect(subject.take_off(plane)).to eq plane
        end

        it 'prevent plane from taking off if weather is stormy' do
            allow(subject).to receive(:weather).and_return("stormy")
            subject.land(plane)
            expect { subject.take_off(plane) }.to raise_error "Cannot take off due to stormy weather"
        end
    end
end