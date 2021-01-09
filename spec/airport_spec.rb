require 'airport'

describe Airport do
    it { is_expected.to respond_to(:land, :take_off) }

    describe '#land' do
        it 'raises an error when the airport is full' do
            expect { subject.land }.to raise_error 'Airport is full'
        end
    end

    it 'confirms plane is no longer in airport after take off' do
        expect(subject.take_off).to be(true)
    end
end