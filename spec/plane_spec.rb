require 'plane'

# When we create a new plane, it should be "flying",
# thus planes can not be created in the airport.
#
# When we land a plane at the airport, the plane in question should
# be "landed"
#
# When the plane takes of from the airport, it should be "flying" again
#
# Think about your implementation - does it allow a plane to be "flying" and landed?
# Are you testing that?

describe Plane do

 # it { is_expected.to respond_to landed? }

  it 'is flying after take off' do
    airport = Airport.new
    airport.take_off subject
    expect(subject).to be_flying
  end

  #it 'is landed after landing' do
  #  expect(subject).to be_landed
  #end

end
