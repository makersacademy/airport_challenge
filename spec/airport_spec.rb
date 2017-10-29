require './lib/airport.rb'
require './lib/plane.rb'

airport = Airport.new

describe Airport do
  it { expect(Airport.new).to respond_to(:land) }
end

describe 'land method' do
  it "Check if land method lands a Plane" do
  expect(airport.hangar[0]).to be_instance_of(Plane)
 end
end

describe Airport do
  it { expect(Airport.new).to respond_to(:take_off) }
end

describe 'take_off method' do
  before do
  airport.take_off(0)
 end
  it "Check if take_off method removes plane from @hangar" do
  expect(airport.hangar).to eq []
 end
end
