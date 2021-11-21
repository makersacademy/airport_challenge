require 'airport.rb'
require 'plane.rb'

describe Airport do
    it 'instructs plane to land' do
        airport = Airport.new
        expect(subject).to respond_to(:land).with(1).argument
    end
end