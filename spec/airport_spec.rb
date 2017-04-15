require 'airport'

describe Airport do

it "Creates an emprty array of planes" do
  airport = Airport.new
  expect(airport.planes).to eq []
end
describe '#land'do
  it 'lands a plane' do
    plane = Plane.new
    expect(subject.land(plane)).to eq [plane]
  end
end
describe '#take_off'do

  it 'takes off a plane'do
  plane = Plane.new
  subject.land(plane)
  expect(plane).to receive (:took_off)
  subject.take_off(plane)
end
it 'is expected to remove the plane from the @planes array'do
  plane = Plane.new
  subject.land(plane)
  subject.take_off(plane)
  expect(subject.planes).not_to eq [plane]
end
end
end
