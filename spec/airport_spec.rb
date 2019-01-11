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

      it 'should allow plane to take off' do
        plane=Plane.new
        subject.land(plane)
        subject.take_off(plane)
        expect(subject.planes_at_airport).not_to include(plane)
      end

      it 'when the plane leaves it should confirm it has left the airport' do
        plane=Plane.new
        subject.land(plane)
        expect(subject.take_off(plane)).to eq("Plane #{plane} has left")
      end
    end

  end

    # describe '#confirm_plane_left' do
    #   it {is_expected.to respond_to :confirm_plane_left}
    #
    #   it 'should confirm that the plane has left the airport' do
    #   plane=Plane.new
    #   subject.land(plane)
    #   subject.take_off(plane)
    #   subject.confirm_plane_left(plane)
    #   expect(subject.planes_at_airport).not_to include(plane)
    #   end
    # end
