require 'plane'

describe Airport do
subject(:airport) { described_class.new }
let(:plane) { double(:plane) }

it { is_expected.to respond_to(:park).with(1).argument }

it 'Lets landing planes #park in apron' do
  airport.park(:plane)
end

it 'Raises an error if a plane tries to land when the apron is full' do
  airport.capacity.times { airport.park(plane) }
  expect { airport.park(plane) }.to raise_error 'The airport is full, abort landing!'
end

end
