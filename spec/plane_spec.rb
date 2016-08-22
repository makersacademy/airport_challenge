require 'plane'

describe Plane do

  subject { described_class.new }
  let(:airport) { Airport.new }

  describe '#landed' do
    it 'shows plane as flying by default' do
      expect(subject.landed?).to be(false)
    end
  end

  context 'after being allowed to land' do
    it 'landed status is true' do
      airport.allow_to_land(subject)
      expect(subject.landed?).to be(true)
    end
  end

  context 'after taking off' do
    it 'landed status is false' do
      airport.allow_to_land(subject)
      airport.take_off(subject)
      expect(subject.landed?).to be(false)
    end
  end

end
