require 'plane'

describe Plane do
  it 'respnds to #land' do
    expect(subject).to respond_to(:land)
  end

  it 'respnds to #take_off' do
    expect(subject).to respond_to(:take_off)
  end
  it 'takes off from airport' do
    airport = subject.take_off
    expect(airport).to be_plane_in_airport
  end
end
