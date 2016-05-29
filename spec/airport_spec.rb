require 'airport'

describe Airport do
  subject(:airport) { described_class.new }

    describe '#land' do
      it 'responds to land' do
        expect(subject).to respond_to :land
      end

      it 'confirms a plane has landed' do
        plane = double(:plane, :landed? => true)
        expect(subject.land(plane)).to eq "The plane has landed"
      end

      describe '#take_off'
        it 'responds to take_off' do
          expect(subject).to respond_to :take_off
        end

        it 'confirms a plane has taken off' do
          plane = double(:plane, :take_off? => true)
          expect(subject.take_off(plane)).to eq "The plane has taken off"
        end

        # it 'does not let a plane take off the weather is stormy' do
        #   plane = Plane.new
        #   expect { subject.take_off(plane) }.to raise_error 'It is too stormy to take off. Hold tight'
        # end
  end
end
