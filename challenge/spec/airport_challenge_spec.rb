require 'airport_challenge'

describe 'Airport' do

it 'can create an instance of class Airport' do
  jfk_airport = Airport.new
  expect(jfk_airport).to be_a Airport
end
end
