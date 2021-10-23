# require_relative '../lib/airport.rb'
require 'airport'

describe Airport do
   
  # first test for first user story
  it 'lands a plane' do
    airport = Airport.new
    plane = Plane.new
    expect(airport).to respond_to(:land).with(1).argument
  end

  
end
