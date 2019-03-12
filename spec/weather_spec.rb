require 'weather'

describe Weather do
  describe '#weather' do
    it { is_expected.to respond_to(:stormy?) }

    it 'should return either true or false' do
      expect(subject.stormy?).to eq(true).or eq(false)
    end
  end
end
