require './lib/plane.rb'
require './lib/airport.rb'
require './lib/weather.rb'

describe Plane do
    it 'creates an instance of the Plane class' do
        plane = Plane.new
        expect(plane).to be_a(Plane)
    end
end