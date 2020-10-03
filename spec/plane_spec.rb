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
  end
end
