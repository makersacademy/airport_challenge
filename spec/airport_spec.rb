require 'airport'
require 'plane'

describe Airport do

    describe '#land' do
      it { is_expected.to respond_to :land }

      it 'should allow plane to land at the airport' do
        plane=Plane.new
        subject.land(plane)
        expect(subject.planes_at_airport).to include plane
      end
    end

    describe '#take_off' do
      it {is_expected.to respond_to :take_off}

      it 'should allow plane to take off and check that it is gone' do
        plane=Plane.new
        subject.land(plane)
        subject.take_off(plane)
        expect(subject.planes_at_airport).not_to include(plane)
      end
    end

end
