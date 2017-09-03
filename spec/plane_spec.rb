require 'plane'
describe Plane do
  it 'has method takeoff' do
    is_expected.to respond_to(:in_airport?)
  end
end
