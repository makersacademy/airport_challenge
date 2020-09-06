require 'plane.rb'

describe Plane do
  it 'Should land at an airport' do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it 'Should takeoff from an airport' do
    expect(subject).to respond_to(:take_off).with(1).argument
  end

  it 'Should confirm that it is no longer in an airport after takeoff' do
    expect(subject).to respond_to(:location?).with(1).argument
  end

end