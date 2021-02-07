require 'airport'

describe Airport do

it 'should store a plane once it lands' do
  expect(subject.land("plane")).to be_instance_of Array
end

it 'should let a plane take off' do
  expect(subject).to respond_to(:take_off).with(1).argument
end

it 'should confirm a plane is no longer in the airport' do
  subject.land("plane")
  expect(subject.take_off("plane")).not_to include("plane")
end

it 'should tell you if an airport is full' do
  hanger = subject.hanger
  hanger > capacity
  expect(subject.full?).to eq true
end

end
