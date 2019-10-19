require 'airport'

describe Airport do

  describe '#take_off' do
    context 'planes should take off from the airport'
      it 'shows plane has left the airport' do
        plane = Plane.new
        subject.land plane
        expect(subject.take_off).to eq 'This plane has left the airport'
      end

      it 'should raise an error if there are no planes to take off' do
        expect { subject.take_off }.to raise_error 'There are no planes in the airport'
      end
  end

  describe '#land' do
    context 'planes should land at the airport'
      it "should let planes land" do
        plane = Plane.new
        expect(subject.land(plane)).to eq [plane]
      end

      it 'should raise error if airport is full' do
        subject.capacity.times { subject.land Plane.new }
        expect { subject.land Plane.new }.to raise_error 'Airport is full'
      end

      it 'has a default capacity' do
        expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
      end
  end
end
