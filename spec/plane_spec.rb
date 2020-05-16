require 'plane'

describe Plane do
  it 'respnds to #land' do
    expect(subject).to respond_to(:land)
  end
  it 'respnds to #take_off' do
    expect(subject).to respond_to(:take_off)
  end
end
