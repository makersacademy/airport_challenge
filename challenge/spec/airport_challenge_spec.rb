require 'airport_challenge'

describe 'Airport' do

it 'can create an instance of class Airport' do
  jfk_airport = Airport.new
  expect(jfk_airport).to be_a Airport
end
end

describe '#land plane' do
it {is_expected.to respond_to(:land)}
end
