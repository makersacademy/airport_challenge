describe Weather do
  subject(:weather) { Weather.new }

  describe '#sunny_or_stormy' do
    it 'responds to .sunny_or_stormy  ' do
      expect(weather).to respond_to(:sunny_or_stormy).with(1).argument
    end

    it 'returns sunny when 1 passed as argument' do
      expect(weather.sunny_or_stormy(1)).to eq 'sunny'
    end
  end
end
