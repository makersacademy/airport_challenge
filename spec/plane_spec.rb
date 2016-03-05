require 'plane'

describe Plane do
  subject(:plane) { described_class.new }

  # it { expect(plane.flying).to be false}

    describe '#land' do
      it 'is on the ground' do
        plane.land
        expect(plane.land).to be true
      end
    end

      describe '#take_off' do
        it 'is airborne' do
          plane.take_off
          expect(plane.take_off).to be true
        end
      end


end