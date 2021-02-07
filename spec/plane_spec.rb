require 'plane'

describe Plane do

  it 'should land at an airport' do
    expect(subject).to respond_to(:land).with(1).argument
  end

it 'should take off from an airport' do
  expect(subject).to respond_to(:take_off).with(1).argument
end

end
