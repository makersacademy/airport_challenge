require 'weather.rb'
context 'FEATURE TESTS' do
  describe 'Feature Test Weather' do
    it 'can be called to have weather' do
        current = Weather.new
        current.the_weather
    end
  end

end
