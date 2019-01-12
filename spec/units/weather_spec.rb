require 'rspec'
require 'weather'

describe Weather do

  before(:each) do
    @weather = Weather.new
  end

  describe 'weather should be reported accurately' do

    it 'should report stormy weather' do
      allow(@weather).to receive(:generate_weather).and_return('stormy')
      expect(@weather.weather).to eq('stormy')
    end

    it 'should report sunny weather' do
      allow(@weather).to receive(:generate_weather).and_return('sunny')
      expect(@weather.weather).to eq('sunny')
    end
  end



end