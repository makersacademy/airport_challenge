require 'weather'

describe Weather do
  subject(:weather) { described_class.new }

  before(:all) do 
    srand(1)
    puts "Random weather generator: #{(15.times.map { rand(1..5) }).inspect}"
  end

  context 'when #current_weather generates random number 1..4' do
    it 'current weather is sunny if number 1 is generated' do
      srand(1)
      2.times.map { rand(1..5) }
      expect(weather.current_weather).to be :sunny
    end
    it 'current weather is sunny if number 2 is generated' do
      srand(1)
      3.times.map { rand(1..5) }
      expect(weather.current_weather).to be :sunny
    end
     it 'current weather is sunny if number 3 is generated' do
      srand(1)
      11.times.map { rand(1..5) }
      expect(weather.current_weather).to be :sunny
    end
    it 'current weather is sunny if number 4 is generated' do
      srand(1)
      expect(weather.current_weather).to be :sunny
    end
  end
  
  context 'when #current_weather generates random number 5' do
   it 'current weather is stormy' do
     srand(1)
     rand(1..5)
     expect(weather.current_weather).to be :stormy
   end
  end

end
