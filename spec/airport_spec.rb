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
end
