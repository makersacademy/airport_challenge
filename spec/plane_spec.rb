require 'plane'

describe Plane do
  it { is_expected.to respond_to(:state) }

  describe '#state' do
    it 'is changeable' do
      expect(subject.state = 'abc'). to eq 'abc'
    end
    it 'has default vale of flying' do
      expect(subject.state). to eq 'Flying'
    end
  end
end
