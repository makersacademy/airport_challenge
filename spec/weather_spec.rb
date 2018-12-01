describe Weather do
  subject(:weather) { Weather.new }

  describe '#sunny_or_stormy' do
    it 'responds to .sunny_or_stormy' do
      expect(weather).to respond_to(:sunny_or_stormy)
    end
  end
end
