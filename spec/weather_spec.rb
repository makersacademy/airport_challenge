require 'weather'


describe Weather do
    it{is_expected.to respond_to(:random_weather_generator)}
    
  
    describe '#random_weather_generator' do
        it 'Randomly generates Stormy or Sunny' do
        expect(subject.random_weather_generator).to eq("Stromy").or(eq("Sunny")) 
        end
    end
end