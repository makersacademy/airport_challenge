require 'weather'

describe Weather do
  it 'should have a set chance of stormy weather' do
    described_class::STORM_CHANCE
  end

  describe "#stormy?" do
    it 'should return true or false' do
      expect(subject.stormy?).to eq(true).or eq(false)
    end
  end
end
