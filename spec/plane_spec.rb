require 'plane'

    describe Plane do

      describe '#land_plane' do
        it 'Confirms plane has landed' do
          expect(subject).to respond_to(:land_plane)
        end
      end

      describe "#plane_landed?" do
        it 'Checks plane status: if the plane has landed' do
          subject.land_plane
          expect(subject).to respond_to(:plane_landed?)
        end
      end

      describe '#take_off_plane' do
        it 'Confirms plane has taken off' do
          expect(subject).to respond_to(:take_off_plane)
       end
     end

end
