require 'airport'

describe Airport do

  it "Creates an emprty array of planes" do
  airport = Airport.new
  expect(airport.planes).to eq []
end

context 'When weather is fine' do
  before do
    allow(subject).to receive(:too_stormy).and_return(false)
  end
end
describe '#land'do
  it 'lands a plane' do
    plane = Plane.new
    expect(subject.land(plane)).to eq [plane]
  end
  it 'raises and error if you try to land a plane that has already landed'do
    plane = Plane.new
    subject.land(plane)
    expect expect { subject.land(plane) }.to raise_error 'The plane has already landed'
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
end

context 'When weather is stormy' do
  before do
    allow(subject).to receive(:too_stormy).and_return(true) #For some reason this is not setting the too_stormy too eq true as I would expect it too. When too_stormy is hard coded to be true, the test passes.
    p (subject.too_stormy?)
 end

#describe '#take_off' do
  #it 'Gives error message when too stormy too take off'do
    #plane = Plane.new
    #subject.land(plane)
    #expect{ subject.take_off(plane) }.to raise_error 'It is too stormy to take off'
  #end
#end
end
end
