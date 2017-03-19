require './lib/plane.rb'
require './lib/airport.rb'

describe Plane do
  describe "#Plane Status" do
  it { is_expected.to respond_to :status_land}
  it { is_expected.to respond_to :status_takeoff}
  it "checks that status_land changes status to landed" do
  expect(subject.status_land).to eq "Landed"
end
  it "checks that status_takeoff changes status to takeoff" do
  expect(subject.status_takeoff).to eq "Flying"
end
end
end
