require 'weather'

describe Weather do

  it { is_expected.to respond_to(:prevent_takeoff)}

describe 'storm blocks landing' do
  allow(weather).to receive(:stormy?).and_return true
  message = 'Unable to land due to stormy weather'
  expect { airport.land(plane) }.to raise_error message
end
end


# As an air traffic controller 
# To ensure safety 
# I want to prevent landing when weather is stormy 