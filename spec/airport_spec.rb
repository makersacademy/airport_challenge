require 'airport.rb'
require 'plane.rb'

describe Airport do
  it 'Should allow a plane to land if there is space' do
    expect(subject).to respond_to(:land_airport)
  end

  it 'Should allow a plane to takeoff' do
    expect(subject).to respond_to(:take_off_airport)
  end

end