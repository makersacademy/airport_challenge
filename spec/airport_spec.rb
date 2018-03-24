require 'airport'
require 'byebug'

describe Airport do 
  it { is_expected.to respond_to(:weather) }
  
  describe '.weather' do 
    it 'returns a weather string' do 
      weather = subject.weather
      expect(weather).to be_a(String)
    end
  end
end 
