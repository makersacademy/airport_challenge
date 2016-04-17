require 'plane'

describe Airport do
let(:plane) { double(:plane)}

it { is_expected.to respond_to(:park).with(1).argument }

it 'Lets landing planes #park in apron' do
subject.park(:plane)
end

it 'Raises an error if a plane tries to land when the apron is full' do
  subject.capacity.times { subject.park(plane) }
  expect { subject.park(plane) }.to raise_error 'The airport is full, abort landing!'
end
end
