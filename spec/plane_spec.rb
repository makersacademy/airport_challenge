require 'plane'

describe Plane do
  subject(:plane) { described_class.new }

  describe '#took_off' do
    it 'raises an error if the plane already took off' do
      error = "The plane is already flying- cannot take off"
      expect { subject.took_off }.to raise_error error
    end
  end

  describe '#flying?' do
    it { is_expected.to respond_to :flying? }

    it 'raises an error if the plane is already flying' do
      error = "The plane is already flying- cannot be in an airport"
      expect { subject.flying? }.to raise_error error
    end
  end

end
