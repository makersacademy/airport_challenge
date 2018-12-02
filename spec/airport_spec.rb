require 'airport'

describe Airport do

  it 'will instruct a plane to land' do
    airport = Airport.new
    expect(airport).to respond_to(:land).with(1).argument
  end

it { is_expected.to respond_to(:takeoff) }

end
