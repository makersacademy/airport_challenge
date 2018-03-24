require 'airport'
require 'byebug'

describe Airport do 
  describe '.new' do 
    it 'initializes with a default value for @max_capacity' do
      expect(subject.max_capacity).to be(100)
    end 

    it 'allows @max_capacity to be set via an argument' do 
      airport = Airport.new(2000)
      expect(airport.max_capacity).to eq(2000)
    end 
  end 

  it { is_expected.to respond_to(:weather) }
  
  describe '.weather' do 
    it 'returns a weather string' do 
      weather = subject.weather
      expect(weather).to be_a(String)
    end
  end
end 
