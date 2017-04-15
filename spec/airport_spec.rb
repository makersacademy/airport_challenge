require 'airport'

describe Airport do

context 'When weather is fine' do
  before do
    allow(subject).to receive(:too_stormy).and_return(false)
  end
end
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
it 'is expected to raise an error if the plane is not at the airport'do
  plane = Plane.new
  expect { subject.take_off(plane) }.to raise_error 'This plane is currently not at the airport'
end
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


context 'When weather is stormy' do
  before do
    allow(subject).to receive(:too_stormy).and_return(true)
    p (subject.too_stormy?)
  end
describe '#take_off' do
  it 'Gives error message when too stormy too take off'do
    plane = Plane.new
    subject.land(plane)
    expect{ subject.take_off(plane) }.to raise_error 'It is too stormy to take off'
  end
end
end
end
end
