

## Note these are just some guidelines!
## Feel free to write more tests!!

# When we create a new plane, it should be "flying",
# thus planes can not be created in the airport.
#
# When we land a plane at the airport, the plane in question should
# be "landed"
#
# When the plane takes of from the airport, it should be "flying" again
#
# Think about your implementation - does it allow a plane to be "flying"
# and landed?
# Are you testing that?
require 'plane'

# describe Plane do
#  it { is_expected.to respond_to :flying? }
# end

describe Plane do
let(:plane) { Plane.new }
  
	it {is_expected.to respond_to(:land)}
	it {is_expected.to respond_to(:take_off)}
  
  describe 'new' do
  
it 'Plane should be flying' do 
    expect(Plane.new).to respond_to(:flying?)
		end 
	end 
  
it "landing plane" do 
  plane.land
  expect(plane.flying?).to eq(false)
  end

it "plane takes off" do 
plane.take_off
expect(plane.flying?).to eq(true)
end
end

