require 'plane'

describe Plane do
  describe '#in_air' do
    it { is_expected.to respond_to(:in_air?) }

    it 'responds true after take-off' do
      airport = Airport.new
      allow(airport).to receive(:weather_report).and_return("sunny")
      airport.land(subject)
      plane = airport.take_off
      expect(plane.in_air?).to eq(true)
    end

    it 'responds false before take_off' do
      expect(subject.in_air?).to eq(false)
    end

    it 'responds false after landing, pre-take-off' do
      airport = Airport.new
      allow(airport).to receive(:weather_report).and_return("sunny")
      plane = airport.land(subject)
      plane = plane.pop
      expect(plane.in_air?).to eq(false)
    end
  end
end
