require 'airport'
require 'weather'

describe Airport do

  it { is_expected.to respond_to(:capacity)}

it "can set a different airport capacity" do
  new_airport = Airport.new(50)
  expect(new_airport.capacity).to eq 50
end

  it "allows multiple planes to land" do
    plane = Plane.new
    subject.land(plane)
    expect(subject.planes[0]).to eq plane
  end

   it "doesn't allow more planes to land than capacity" do
    airport90 =Airport.new(9)

    9.times{airport90.land(Plane.new)}
    expect{airport90.land(Plane.new)}.to raise_error("Airport full")
  end

  it "returns a message letting the user know the plane has landed" do
    plane = Plane.new
    expect(subject.land(plane)).to eq ("Plane has landed")
  end

  it "allows a plane to take off" do
    plane = Plane.new
    subject.land(plane)
    subject.take_off(plane)
    expect(subject.planes[0]).not_to eq plane

  end

  it "returns a message letting the user know the plane has taken off" do
    plane = Plane.new


    subject.land(plane)

    expect(subject.take_off(plane)).to eq ("Plane has taken off")
  end

describe "#stormy"do

  it "doesn't allow a plane to take off if the weather is stormy" do
    plane = Plane.new
    subject.land(plane)

    expect{subject.take_off(plane)}.to raise_error("Too stormy to take off")


end
end
it "doesn't allow a plane to land if the weather is stormy" do
    plane = Plane.new

    subject.land(plane)

    expect{subject.land(plane)}.to raise_error("Too stormy to land")




end
end



