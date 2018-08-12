require 'weather_station'

describe WeatherStation do 
    subject(:weatherstation) { described_class.new }  

    describe ' #conditions_report ' do 
        it 'generates conditions' do 
            expect(subject.conditions_report).to eq('calm').or(eq('stormy'))
        end
    end

    describe ' #conditions_safe? ' do 
        it 'checks if conditions are safe to manouevre' do
            expect(subject.conditions_safe?).to eq(true).or(eq(false))
        end   
    end

end
