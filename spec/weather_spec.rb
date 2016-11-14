require 'weather'

describe Weather do
    subject(:weather) {described_class.new}

# As an air traffic controller
# To ensure safety
# I want to prevent takeoff when weather is stormy

it 'prevents planes from taking off when stormy' do
  allow(weather).to receive(:stormy?).and_return true
  expect { weather.prevents_takeoff }. to raise_error 'Cannot take off due to stormy weather'
  end

# As an air traffic controller
# To ensure safety
# I want to prevent landing when weather is stormy

it 'prevents planes from landing when stormy' do
  allow(weather).to receive(:stormy?).and_return true
  expect { weather.prevents_landing }. to raise_error 'Cannot land due to stormy weather'
  end

end
