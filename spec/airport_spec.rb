require 'airport'

describe Airport do

it 'should store a plane once it lands' do
  expect(subject.land("plane")).to be_instance_of Array
end

it 'should let a plane take off' do
  expect(subject).to respond_to(:take_off).with(1).argument
end
end
