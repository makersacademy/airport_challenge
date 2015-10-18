require 'weather'

describe Weather do
  class DummyClass
  end
  before(:all) do
    @dummy = DummyClass.new
    @dummy.extend Weather
  end

  describe '#weather' do
  
    it 'is expected to be sunny or stormy' do
      weather_options=['Sunny', 'Stormy']
      expect((weather_options).include?(@dummy.weather)).to be true
    end 
  end
end
