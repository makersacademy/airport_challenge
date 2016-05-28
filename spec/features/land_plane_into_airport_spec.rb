require 'spec_helper.rb'
require 'plane'
require 'airport'

feature 'Landing a plane into an airport' do

  context 'When weather conditions are good and airport has capacity' do
    scenario 'Air traffic controller can land a plane' do
      plane = Plane.new
      airport = Airport.new
      expect{airport.receive(plane)}.not_to raise_error
    end
  end 
end
