require 'plane'

  describe Plane do

    describe '#is_flying?' do
      it 'can tell if it is flying or has landed' do
        expect(subject).to respond_to(:is_flying?)
      end


      describe '#takeoff' do
        it 'responds to take_off method' do
          expect(subject).to respond_to(:takeoff)
        end

        it 'becomes airborne when take_off is called' do
          subject.land
          subject.takeoff
          expect(subject.is_flying?).to eq true
        end
      end

    end
end
