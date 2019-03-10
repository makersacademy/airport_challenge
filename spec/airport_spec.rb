require 'airport'
describe Airport do

  # test described in Step 04 in the README
  it "has a default capacity of 20" do
    airport = Airport.new
    expect(airport.capacity).to eq 20
  end

  # test described in Step 05 in the README
  it "can take an override capacity" do
    airport = Airport.new(55)
    expect(airport.capacity).to eq 55
  end

  # test described in Step 11 in the README
  it "can store a plane" do
    airport = Airport.new
    plane = double(:plane)
    airport.store(plane)
    expect(airport.hangar).to eq [plane]
  end

  # test described in Step 16 in the README
  it "can release a plane" do
    airport = Airport.new
    plane = double(:plane)
    airport.store(plane)
    airport.release(plane)
    expect(airport.hangar).to eq []
  end

  # test described in step 20 in the README
  it "can tell us if there is weather at an airport" do
    expect(["clear", "stormy"]).to include(subject.send(:weather))
  end

  # test described in step 20 in the README
  it "can tell us what the weather is like" do
    expect(["clear", "stormy"]).to include(subject.check_weather)
  end

  # test described in step 28 in the README
  it "can tell us when they are full" do
    airport = Airport.new(1)
    plane = double(:plane)
    airport.store(plane)
    expect(airport.not_full).to eq false
  end

end
