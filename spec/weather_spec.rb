require 'weather'

describe Weather do

# As an air traffic controller
# To ensure safety
# I want to prevent takeoff when weather is stormy

it 'prevents planes from taking off when stormy' do
  expect { subject.prevents_takeoff }. to raise_error 'Cannot take off due to stormy weather'
  end

# As an air traffic controller
# To ensure safety
# I want to prevent landing when weather is stormy

end
