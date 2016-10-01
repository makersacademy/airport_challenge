require 'airport'

describe Airport do

  it { is_expected.to respond_to(:land).with(1).argument }

  describe '#land' do
      it { is_expected.to respond_to(:land).with(1).argument }

      it 'lands a plane at the airport' do
        plane = Plane.new
        expect(subject.land(plane)).to be plane
        end
      end

end
