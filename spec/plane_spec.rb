require 'plane'

  describe Plane do

    describe '#is_flying?' do
      it 'can tell if it is flying or has landed' do
        expect(subject).to respond_to(:is_flying?)
      end

    end
end
