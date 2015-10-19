require 'weather'

describe Weather do
  subject { described_class.new }
  context 'The Weather' do
    it { is_expected.to respond_to(:stormy?) }

    it 'The weather is either sunny or stormy' do
      expect(subject.stormy?).to satisfy {|value| [true, false].include? value}
    end
  end
end
