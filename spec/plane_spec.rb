require 'plane'

describe Plane do
  subject(:plane) { described_class.new }

    describe '#land' do
      it 'is on the ground' do
        plane.land
        expect(plane.flying).not_to eq true
      end
    end

      describe '#take_off' do
        it 'is airborne' do
          plane.take_off
          expect(plane.flying).to eq true
        end
      end


end