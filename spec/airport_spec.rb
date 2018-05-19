require 'airport'

describe Airport do

  let(:plane) {Plane.new}

  describe '#land' do
    it 'responds to land' do
      expect(subject).to respond_to(:land)
    end

    it 'lands a plane at an airport' do
      subject.land(plane)
      expect(subject.planes).to include(plane)
    end
  end
end
