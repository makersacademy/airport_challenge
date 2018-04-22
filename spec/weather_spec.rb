describe Weather do
  describe '#stormy' do
    it 'randomly generates weather' do
      srand(10)
      weather_arr = []
      100.times { weather_arr << subject.stormy? }
      expect(weather_arr).to include(true, false)
    end
  end
end
