require 'weather'

describe Weather do
  it { is_expected.to respond_to :stormy? }

  describe '#stormy?' do
    it 'returns a random boolean' do
      expect(subject.stormy?).to satisfy do |x|
        x == true || x == false
      end
    end
  end
end
