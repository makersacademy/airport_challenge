require "airport"
require "plane"

RSpec.describe Airport do
  subject {Airport.new([], 5)}
  let(:plane) {Plane.new}

  describe '#land' do
    context "when airport isn't full" do
      it 'allows a plane to land' do
        expect(subject.land(plane)).to eq "Plane landed"
        expect(subject.planes).to include(plane)
      end
    end
    context "when airport is full" do
      
      subject {Airport.new(Array.new(5, Plane.new))}
      
      it 'prevents a plane from landing' do
        expect{subject.land(plane)}.to raise_error("Airport full; cannot land plane.")
      end
    end
  end
  describe '#takeoff' do
    it 'allows a plane to take off' do
      subject.land(plane)
      expect(subject.takeoff(plane)).to eq "Plane taken off"
      expect(subject.planes).not_to include(plane)
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
