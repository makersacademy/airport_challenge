require 'plane'

describe Plane do
  describe '#in_air' do
    it { is_expected.to respond_to(:in_air?) }

    it 'responds true after take-off' do
      airport = Airport.new
      airport.land(subject)
      plane = airport.take_off(subject)
      expect(plane.in_air?).to eq(true)
    end

    it 'responds false before take_off' do
      expect(subject.in_air?).to eq(false)
    end

    it 'responds false after landing, pre-take-off' do
      airport = Airport.new
      plane = airport.land(subject)
      expect(plane.in_air?).to eq(false)
    end
  end
end
