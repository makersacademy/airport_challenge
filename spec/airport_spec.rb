require 'airport'

describe Airport do

  it "has default capacity" do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it "has variable capacity" do
    airport = Airport.new(1000)
    expect(airport.capacity).to eq 1000
  end

  it "should know 1 plane is landed" do
    plane = Plane.new
    plane.land(subject)
    expect(subject.landed_planes).to eq [plane]
  end

  it "should know 2 planes are landed" do
    plane1 = Plane.new
    plane1.land(subject)
    plane2 = Plane.new
    plane2.land(subject)
    expect(subject.landed_planes).to eq [plane1,plane2]
  end

  it "knows when it is full" do
    41.times do
      subject.landed_planes << Plane.new
    end
    expect(subject.full).to be true
  end

  it {is_expected.to respond_to :stormy_weather }

end
