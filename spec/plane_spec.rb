require 'plane'

describe Plane do

  subject(:plane) { described_class.new }

  describe '#land_plane' do

  it ' can be landed by responding to land_plane' do
    expect(plane).to respond_to(:land_plane)

  end

  it 'lands the plane at the given airport' do
    expect(plane).to respond_to(:land_plane).with(1).argument
  end

  it 'is not allowed to land at the airport if the airport capacity is reached' do
    # need to refactor this test to include doubles
    airport = double("airport", :airport_full? => true)
    plane = Plane.new
    expect {plane.land_plane(airport)}.to raise_exception

  end

  it 'raises an error when intstructed to land at an airport with stormy weather' do
    airport = double("airport", :airport_full? => true, :weather => 'stormy')
    expect {plane.land_plane(airport)}.to raise_exception

  end
  end



end
