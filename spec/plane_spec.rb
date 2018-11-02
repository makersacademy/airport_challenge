require 'plane'
require 'airport'

describe Plane do
  it 'lands when sent #land message from airport' do
    expect(subject).to respond_to(:land)
  end
  it 'takes off when sent #take_off message from airport' do
    expect(subject).to respond_to(:take_off)
  end
end
