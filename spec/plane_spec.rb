require 'plane'

describe Plane do


  it 'lands a plane' do
    plane = Plane.new
    airport = Airport.new
    airport.land(plane)
    expect(plane.has_landed?).to eq true
    expect(plane.has_landed?).to output("Plan has landed")
  end

it 'a plane is not landed before it lands' do
  plane = Plane.new
  expect(plane.has_landed?).to eq false
  expect(plane.has_landed).to output("Plane has not yet landed")
end

it 'returns a message saying the plane as landed after it lands' do
plane = Plane.new
  expect(plane.land).to output("You have landed the plane at the airport")
  end



end
