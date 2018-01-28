require 'weather'

describe Weather do 
  it { is_expected.to respond_to(:stormy?) }

  describe '#stormy?' do
    it 'returns a boolean' do 
      expect(subject.stormy?).to be(true).or be(false)
    end
  end

end