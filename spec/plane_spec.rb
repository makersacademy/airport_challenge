require 'plane'

describe Plane do

  subject(:plane) { described_class.new }

  describe '#land_plane' do
  let (:airport) { double('airport', :planes_in_airport => [], :weather => 'fine', :airport_full? => false) }

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

  it 'raises an error when instructed to land at an airport with stormy weather' do
    allow(airport). to receive(:weather) { 'stormy' }
    expect {plane.land_plane(airport)}.to raise_exception

  end

  it 'raises an error when instructed to land after being landed' do

    plane.land_plane(airport)
    expect { plane.land_plane(airport) }.to raise_exception

  end

  end

  describe '#takeoff' do
    let(:airport) { double('airport', :planes_in_airport => [], :weather => 'fine', :airport_full? => false) }

    it 'takes off from the airport and is removed from airport capacity' do
      plane.land_plane(airport)
      plane.takeoff(airport)
      expect(airport.planes_in_airport).to eql([])

    end



  end



end
