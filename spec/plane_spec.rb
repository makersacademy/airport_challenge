require 'plane'
describe Plane do
  let(:plane) { Plane.new }
  let(:airport) { double('airport') }
  it "responds to #flying" do
    is_expected.to respond_to(:flying)
  end
  it "has a default value flying set to false" do
    expect(subject.flying).to eq false
  end
  it "plane is not flying when landed" do
    plane.land
    expect(plane.flying).to eq false
  end
  it "plane is flying after takeoff" do
    plane.takeoff
    expect(plane.flying).to eq true
  end
end
