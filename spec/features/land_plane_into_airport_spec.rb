require 'spec_helper.rb'
require 'airport'

feature 'Landing a plane into an airport' do

  context 'When weather conditions are good and airport has capacity' do
    scenario 'Air traffic controller can land a plane' do
      plane = Plane.new
      airport = Airport.new
      expect{airport.receive(plane)}.to not_raise an_error
    end
  end 
end
