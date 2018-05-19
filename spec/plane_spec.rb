require 'plane'

describe Plane do
  describe '#landed?' do
    it 'checks whether the plane has landed' do
      expect(subject).to respond_to :landed?
    end
  end

  describe '#make_land' do
    it 'grounds the plane at the airport' do
      subject.make_land
      expect(subject.landed?).to eq true
    end
  end

  describe '#make_take_off' do
    it 'makes the plane take off' do
      subject.make_take_off
      expect(subject.landed?).to eq false
    end
  end
end
