require 'airport'

describe Airport do

  let (:plane) {Plane.new}
  let (:airport) {Airpot.new}

  it 'allows for a plane to land' do
  expect(subject).to respond_to(:land)
end

  it 'allows for a plane to take off' do
  expect(subject).to respond_to(:take_off)
end

  it 'checks that a plane is removed from airport when it takes off' do
    subject.land(plane)
    expect(subject.take_off(plane)).to eq plane
  end

it 'raises an error when the airport is at full capacity' do
  50.times{subject.land(plane)}
  expect{subject.land(plane)}.to raise_error("the airport is full")
end

describe '#initialize' do
   it 'check that capacity is default if not set'  do
       airport = Airport.new()
       expect(airport.capacity).to eq 50
   end

   it 'check that capacity can be changed'  do
       airport = Airport.new(25)
       expect(airport.capacity).to eq 25
   end
 end
end
