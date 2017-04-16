require 'weather'

describe Weather do
  it { is_expected.to respond_to :stormy? }

  describe '#stormy' do
    it 'returns stormy as a boolean' do
      expect(subject.stormy?).to satisfy do |bool|
        bool == true || bool == false
      end
    end
  end
end
