require 'plane'

describe Plane do

  describe '#land' do
    it { is_expected.to respond_to(:land) }

    it 'has landed' do
      subject.land
      expect(subject.landed).to eq true
    end
  end
end
