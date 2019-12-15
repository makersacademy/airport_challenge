require 'airport'
require 'plane'

describe Airport do # No open close quotes for Airport!
    # Create a double for the planes
    let(:plane) {double :plane, :landed= => false, landed?: false}
    # Respond to a method called land.
    it { is_expected.to respond_to :land }

    # Check that method land respond to one argument
    it { is_expected.to respond_to(:land).with(1).argument }

    # Respond to plane array
    it { is_expected.to respond_to :planes}

    # Check if there's no planes initially in the airport
    it 'checks to make sure there is no plane in the airport' do
        expect(subject.planes).to eq []
    end

    # Respond to a method called take off
    it { is_expected.to respond_to :take_off}

    # Check the plane is no longer there after taking off
    it 'checks to make sure the plane is no longer there after taking off' do
        # allow(plane).to receive(:landed).and_return(false)
        subject.land(plane)
        allow(plane).to receive(:landed).and_return(true)
        subject.take_off(plane)
        expect(subject.planes).to_not include(plane)
    end

    # airport prevent landing when airport is full
    describe '#land' do
        it 'prevents landing when airport is full' do
            described_class::DEFAULT_CAPACITY.times{subject.land(Plane.new)}
            expect { subject.land Plane.new }.to raise_error 'Airport is full'
        end
    end

    # able to overwrite the capacity of the airport
    it 'is able to overwrite the capacity of the airport' do
        expect(subject.capacity=30).to eq 30
    end
end