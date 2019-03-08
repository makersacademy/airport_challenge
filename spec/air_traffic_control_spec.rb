# test

# As an air traffic controller
# So I can get passengers to a destination
# I want to instruct a plane to land at an airport

require 'air_traffic_control'

describe Control do
  it 'creates new Control' do
    expect(Control.new)
  end

  it {is_expected.to respond_to(:land)}

end
