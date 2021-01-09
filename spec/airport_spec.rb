require 'airport'

describe Airport do

    it 'should respond to land' do
        expect(Airport.new).to respond_to(:land).with(1).argument
    end

    it 'reports plane in hangar' do
        plane = Plane.new
        expect(subject.land(plane)).to include plane
    end

    it 'should repond to take_off' do
        expect(Airport.new).to respond_to(:take_off).with(1).argument
    end

    it 'has a default capacity' do
        expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end


    # describe 'initialization' do
    #     it 'defaults capacity' do
    #         subject { Airport.new }
    #         let(:plane) { Plane.new }
    #         described_class::DEFAULT_CAPACITY.times do
    #             subject.land(plane)
    #         end
    #         expect { subject.land(plane) }.to raise_error
    #     end
    # end

    describe '#land' do
        it 'raises an error when the airport is full' do
            subject.capacity.times { subject.land(Plane.new) }
            expect { subject.land(Plane.new) }.to raise_error 'Airport is full'
        end
    end

    # it 'confirms that the plane is not longer in the hangar' do
    #     expect(subject.take_off(Plane.new)).to eq @hangar.pop(Plane.new)
    # end

end
