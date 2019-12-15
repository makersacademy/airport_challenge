require 'airport'

describe Airport do

    let (:plane) { double :plane }

    describe '#land' do
        it 'allow plane to land at aiport' do
            allow(subject).to receive(:rand_number).and_return(4)
            expect(subject.land(plane)).to eq [plane]
        end

        it 'prevents planes from landing if airport full' do
            allow(subject).to receive(:rand_number).and_return(5)
            subject.capacity.times { subject.land(plane) }
            expect { subject.land(plane) }.to raise_error "Cannot land because airport is full"
        end

        it 'prevent planes from landing if weather is stormy' do
            allow(subject).to receive(:rand_number).and_return(1)
            expect { subject.land(plane) }.to raise_error "Cannot land plane due to stormy weather"
        end
    end

    describe '#take_off' do
        it 'allow plane to take-off' do
            allow(subject).to receive(:rand_number).and_return(3)
            subject.land(plane)
            expect(subject.take_off(plane)).to eq plane
        end

        it 'prevent plane from taking off if weather is stormy' do
            allow(subject).to receive(:rand_number).and_return(1)
            expect { subject.take_off(plane) }.to raise_error "Cannot take off due to stormy weather"
        end
    end
end