require_relative '../lib/weather.rb'

describe Weather do

  describe 'weather conditions' do
    it { is_expected.to respond_to(:change_weather) }
    it 'selects a random weather condition when instantiated' do

    end
    it 'changes the weather when instructed' do

    end
  end
end
