require './lib/plane'

describe Plane do
  let(:plane) { Plane.new }

  it '#can take off' do

    expect(plane).to respond_to(:take_off)
  end

  it '#can land' do

    expect(plane).to respond_to(:land)
  end

  it '#won\'t take off if in flight' do
    plane.take_off

    expect { plane.take_off }.to raise_error("This plane is already in flight - it cannot take off")
  end

  it '#won\'t land if grounded' do

    expect { plane.land }.to raise_error("This plane is grounded, and doesn't need to land")
  end
end
