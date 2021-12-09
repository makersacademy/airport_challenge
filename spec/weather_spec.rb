require 'weather'
    describe 'by default' do
      it 'weather is sunny' do
        weather = Weather.new
        expect(weather.sunny).to be true
      end
    end