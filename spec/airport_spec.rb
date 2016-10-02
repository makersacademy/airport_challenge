require 'airport'

describe Airport do
  it "has a limited capicity of planes" do
  expect(subject.capacity).to eq(Airport::DEFAULT_CAPACITY)
  end

  it "can  get a plane to land" do
  plane = double(:plane)
  allow(plane).to receive(:plane_number).and_return('1234')
  allow(subject).to receive(:stormy) {false}
  subject.landed_planes(plane)
  expect(subject.list_landed_planes).to include(plane)
  end

  it "confirms a plane has landed" do
  plane = double(:plane)
  allow(plane).to receive(:plane_number).and_return('1234')
  allow(subject).to receive(:stormy) {false}
  subject.confirms_landed(plane)
  expect(subject.confirms_landed(plane)).to eq("The plane #{plane.plane_number} has landed")
  end

  it "can  get a plane to take off" do
  plane = double(:plane)
  allow(plane).to receive(:plane_number).and_return('1234')
  allow(subject).to receive(:stormy) {false}
  subject.taken_off_planes(plane)
  expect(subject.list_taken_off_planes ).to include(plane)
  end

  it "confirms a plane has taken off" do
  plane = double(:plane)
  allow(plane).to receive(:plane_number).and_return('1234')
  allow(subject).to receive(:stormy) {false}
  subject.confirms_taken_off(plane)
  expect(subject.confirms_taken_off(plane)).to eq("The plane #{plane.plane_number} has taken off")
  end

  it "doesn't let a plane to land if it is full" do
  plane = double(:plane)
  allow(plane).to receive(:plane_number).and_return('1234')
  allow(subject).to receive(:stormy) {false}
  55.times{subject.landed_planes(plane)}
  expect(subject.landed_planes(plane)).to eq("The airport is full, the plane #{plane.plane_number} can't land")
  end

  it "forbids planes to land if the weather is stormy" do
  plane = double(:plane)
  allow(plane).to receive(:plane_number).and_return('1234')
  allow(subject).to receive(:stormy) {true}
  expect(subject.landed_planes(plane)).to eq("The plane #{plane.plane_number} can't land due to stormy weather")
  end

  it "forbids planes to take off if the weather is stormy" do
  plane = double(:plane)
  allow(plane).to receive(:plane_number).and_return('1234')
  allow(subject).to receive(:stormy) {true}
  expect(subject.taken_off_planes(plane)).to eq("The plane #{plane.plane_number} can't take off due to stormy weather")
  end

end
