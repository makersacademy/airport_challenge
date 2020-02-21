require 'airport_challenge'

describe 'Airport' do
it 'can create an instance of class Airport' do
  jfk_airport = Airport.new
  expect(jfk_airport).to be_a Airport
end
  it 'can land a plane' do
    jfk_airport = Airport.new
    jfk_airport.land
  expect(jfk_airport).to respond_to(:land)
  end
end
