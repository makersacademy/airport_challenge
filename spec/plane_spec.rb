require 'plane'

describe Plane do
  subject(:plane) {described_class.new}

  it {is_expected.to respond_to(:has_landed?)}
  describe '#has_landed' do
    it 'should say the plane has landed' do
      expect(plane.has_landed?).to be(true)
    end
  end

  it {is_expected.to respond_to(:in_airport?)}
  describe '#in_airport' do
    it 'should say the plane has left the airport' do
      expect(plane.in_airport?).to be(false)
    end
  end
end
