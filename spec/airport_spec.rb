require 'airport'

describe Airport do
  it "has a working Airport#land(plane) method" do
    plane = Plane.new
    expect(subject.land(plane)).to eq([plane])
  end

  xit "has a working Airport#takeoff(plane) method" do
    plane = Plane.new
    expect(subject.takeoff(plane)).to eq(plane)
  end

  it "has a working Airport#bad_weather? method" do
    expect(subject.bad_weather?).to eq(true)
  end

  it "can prevent takeoff when there is bad weather" do
    expect(subject.takeoff).to eq("The weather is to bad to fly")
  end
end
