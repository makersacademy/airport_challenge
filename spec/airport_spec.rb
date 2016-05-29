require 'airport'

describe Airport do
  subject(:airport) { described_class.new }

    describe '#land' do
      it 'responds to land' do
        expect(subject).to respond_to :land
      end

      it 'confirms a plane has landed' do
        plane = Plane.new
        expect(subject.land(plane)).to eq "The plane has landed"
      end

      describe '#take_off'
        it 'responds to take_off' do
          expect(subject).to respond_to :take_off
        end

        it 'confirms a plane has taken off' do
          plane = Plane.new
          expect(subject.take_off(plane)).to eq "The plane has taken off"
        end

  end
end
