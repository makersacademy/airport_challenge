require 'weather.rb'
require 'airport.rb'

describe Airport do

    let( :airport ) { Airport.new }
    let( :weather ) { Weather.new }

    it 'can\'t take off if stormy' do
        expect(weather.stormy? == true).to eq 'can\'t take off if stormy'
    end

    it 'can\'t land if stormy' do
        expect(weather.stormy? == true).to eq 'can\'t land if stormy'
    end
    
end