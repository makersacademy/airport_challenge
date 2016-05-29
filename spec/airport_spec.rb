require 'airport'

describe Airport do
  subject(:airport) { described_class.new }

    describe '#land' do
      it 'responds to land' do
        expect(subject).to respond_to :land
      end

      it 'lands a plane' do
        plane = Plane.new
        expect(subject.land(plane)).to eq "The plane has landed"
      end

    
  end
end
