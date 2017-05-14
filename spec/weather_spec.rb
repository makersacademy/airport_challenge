require 'weather.rb'

describe Weather do
  it { is_expected.to respond_to (:stormy?) }

  describe '#stormy?' do
    it 'returns true or false' do
      expect(subject.stormy?).to eq true || false
    end
  end
end
