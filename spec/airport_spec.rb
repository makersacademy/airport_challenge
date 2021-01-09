require 'airport'

describe Airport do

  subject(:airport) { Airport.new }

  it 'instruct a plane to land at an airport' do
    expect(airport).to respond_to(:land).with(1).argument
  end

end