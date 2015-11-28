require 'airport'

describe Airport do
it { should respond_to(:land).with(1).arguments }

it { should respond_to(:take_off) }

it {should respond_to(:stormy?)}

it 'should check for plane landed' do
  plane = Plane.new
  subject.land(plane)
  expect(subject.take_off).to eq plane
end

it "plane can't land if airports full" do
  subject.capacity.times {subject.land(Plane.new)}
  expect{subject.land(Plane.new)}.to raise_error 'airport is full'
end

it "allows the capacity to be changed" do
  airport = Airport.new(20)
  20.times {airport.land(Plane.new)}
  expect {airport.land(Plane.new)}.to raise_error 'airport is full'
end

it "defaults to the default capacity" do
  Airport::DEFAULT_CAPACITY.times {subject.land(Plane.new)}
  expect{subject.land(Plane.new)}.to raise_error 'airport is full'
end

end

  
