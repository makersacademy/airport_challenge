require 'plane'

describe Plane do
  it {is_expected.to respond_to(:has_landed?)}
  describe '#has_landed' do
    it 'should say the plane has landed' do
      expect(subject.has_landed?).to be(true)
    end
  end

  it {is_expected.to respond_to(:in_airport?)}
  describe '#in_airport' do
    it 'should say the plane has left the airport' do
      expect(subject.in_airport?).to be(false)
    end
  end
end
