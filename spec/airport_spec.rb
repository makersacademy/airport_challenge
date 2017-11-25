require './lib/Airport'
describe Airport do

  it "Should have a land method with an object to land as an argument" do
    is_expected.to respond_to(:land).with(1).argument
  end

  it "Should be able to view planes that have landed at it's site" do
    test_plane = Plane.new
    subject.land(test_plane)
    expect(subject.planes).to eq [test_plane]
  end

  it "Should have a takeoff method with an object to do so as an argument" do
    is_expected.to respond_to(:takeoff).with(1).argument
  end

  it "Should no longer have any planes that have taken off at site" do
    test_plane = Plane.new
    subject.land(test_plane)
    expect(subject.planes).to eq [test_plane]
    subject.takeoff(test_plane)
    expect(subject.planes).to eq []
  end

end
