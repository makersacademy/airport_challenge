require 'airport'

describe Airport do
    it { is_expected.to respond_to(:land, :take_off) }

    describe '#land' do
        it 'raises an error when the airport is full' do
            expect { subject.land }.to raise_error 'Airport is full'
        end
    end

    describe '#take_off' do
        # it 'confirms plane is no longer in airport after take off' do
        #     expect(subject.take_off).to be(true)
        # end

        it 'raises an error when weather conditions are stormy' do
            expect { subject.take_off }.to raise_error 'Weather conditions too stormy for landing'
        end
    end

    it 'has a default capacity' do
        Airport::DEFAULT_CAPACITY.should eq(20)
    end

    it { is_expected.to respond_to(:capacity) }

end