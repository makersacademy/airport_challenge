require 'plane'

describe Plane do

  let(:airport) do
    airport = double :airport
    allow(airport).to receive(:land_plane)
    airport
  end

  describe '#initialize' do
    it 'should be flying' do
      expect(subject.landed).to eq false
    end
  end

  describe '#landed?' do
    it 'will show if plane has landed at airport' do
      airport.land_plane(subject)
      expect(subject.landed?).to eq subject.landed
    end
  end

  describe '#parked_at' do
    it 'will show what airport plane is parked at' do
    expect(subject).to respond_to (:parked_at)
    end
  end

end
