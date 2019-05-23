require 'airport'
describe Airport do
    let(:an_airport) { Airport.new }
    context '#planes == []' do
        it "#land('plane')" do
            an_airport.land('plane')
            expect(an_airport.planes.length).to eq(1)
        end
    end
    context '::weather == double of weather set to sunny'
        it '#weather?' do
            weather_dbl = instance_double('Weather', :query => :sunny)
            an_airport.instance_variable_set(:@weather, weather_dbl)
            expect(an_airport.weather?).to eq(:sunny)
        end
end
