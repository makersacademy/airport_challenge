require "airport"
require "plane"

RSpec.describe Airport do
  plane = Plane.new
  describe '#land' do
    it 'allows a plane to land' do
      expect(subject.land(plane)).to eq "Plane landed"
    end
  end
  describe '#takeoff' do
    it 'allows a plane to take off' do
      expect(subject.takeoff(plane)).to eq "Plane taken off"
    end
  end
  describe '#at_airport?' do
    context 'when plane not at airport' do
      it 'returns false' do
        subject.takeoff(plane)
        expect(subject.at_airport?(plane)).to eq false
      end
    end
  end
end