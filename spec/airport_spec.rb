require './lib/airport.rb'
require './lib/plane.rb'

describe Airport do
  it "checks that airport responds to create_new_plane" do
  expect(subject).to respond_to :create_new_plane
  end
  it "checks that airport responds to land" do
  expect(subject).to respond_to :land
  end
  it "checks that airport responds to land method with 1 argument" do
  expect(subject).to respond_to(:land).with(1).argument
end
it "checks that airport lands plane and returns it" do
plane1 = Plane.new
expect(subject.land(plane1)).to eq plane1
end
end
