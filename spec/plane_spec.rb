require 'plane'

describe Plane do

  it { is_expected.to respond_to(:land) }

  it { is_expected.to respond_to(:landed) }

  let(:airport) { Airport.new }

  describe '#land' do
    it 'returns the airport when asked to land' do
      expect(subject.land(airport)).to eq airport
    end
  end

  describe '#landed' do
    it 'returns true when a plane has landed' do
      subject.land(airport)
      expect(subject.landed).to eq true
    end
  end

end
