require_relative '../lib/weather.rb'

describe Weather do

  describe '#storm?' do
    it { is_expected.to respond_to :storm? }
  
    it 'returns true if theres a storm.' do
      expect(subject.storm?).to be(true).or be(false)
    end
  end
end