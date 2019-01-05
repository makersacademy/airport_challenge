require 'weather'

describe Weather do
  describe '.stormy' do
    it 'returns true if rand is 0' do
      expect(Weather.stormy?(0)).to eq(true)
    end

    it 'returns false if rand is not 0' do
      expect(Weather.stormy?(1)).to eq(false)
    end
  end
end
