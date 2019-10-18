require './lib/airport.rb'
require './lib/plane.rb'

describe Airport do
    it 'creates an instance of the airport class' do
        airport = Airport.new
        expect(airport).to be_a(Airport)
    end
end