require 'airport'

describe Airport do

it 'instructs a plane to land' do
  plane = Plane.new
  expect(subject.land(plane)).to eq true
end

it 'instructs plane to take off' do
  plane = Plane.new
  expect(subject.take_off(plane)).to eq true
end

it 'reports that a plane has taken off' do
  plane = Plane.new
  subject.land(plane)
  expect(subject.report(plane)).to eq true
end

end
