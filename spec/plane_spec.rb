require 'plane'

describe Plane do
  subject(:plane) { described_class.new }

    describe '#land' do
      it 'is on the ground' do
        plane.land
        expect(plane).not_to be_flying
      end
    end

      describe '#take_off' do
        it 'is airborne' do
          plane.take_off
          expect(plane).to be_flying
        end
      end


end