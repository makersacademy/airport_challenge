require 'weather_station'

describe WeatherStation do 
    subject(:weatherstation) { described_class.new }  

    describe ' #conditions_safe? ' do 
        it 'checks conditions safe to manouevre' do
            expect(subject.conditions_safe?).to eq(true).or(eq(false))
        end   
    end

end
