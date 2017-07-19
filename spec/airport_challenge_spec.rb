require  "airport_challenge"
describe Airport do
describe "land" do
it{is_expected.to respond_to(:land).with(1).argument}

it " tells plane to land" do
  plane =Plane.new
expect(subject.land(plane)).to eq("Plane landed")
end

it "says when airport is full" do
  plane = Plane.new

  Airport::DEFAULT_CAPACITY.times{subject.land(plane)}
  expect{subject.land(plane)}.to raise_error "The airport is full"
end
end

describe "takeoff" do
  it "tells plane to take off" do
    airport =Airport.new
    expect(airport.takeoff).to eq("Plane took off")
  end
end

  describe "default_capacity"do
    it "checks the default capacity" do
      airport = Airport.new
    expect(airport.capacity).to eq(Airport::DEFAULT_CAPACITY)
  end
end
  it "rests new capacity" do
    airport = Airport.new(50)
  expect(airport.capacity).to eq(50)
end
end
