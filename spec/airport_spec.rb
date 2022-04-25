require 'airport'
require 'plane'

describe Airport do

  it { is_expected.to be_kind_of(Airport)}
  it { is_expected.to respond_to(:land).with(1).argument}
  it 'can land planes' do
    airport = Airport.new
    plane = Plane.new
    expect(airport.land(plane)).to eq("#{plane} landed")
  end
  it { is_expected.to respond_to(:take_off).with(1).argument}
  it 'can limit the number of planes that can land' do
    airport = Airport.new
    expect(airport.plane_inventory).to be <= airport.capacity
  end
  describe '#land' do 
    it 'raises an landing error when full' do 
    airport = Airport.new
    plane = Plane.new
    @plane_inventory = [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 , 13, 14, 15, 16, 17, 18, 19, 20, 21] 
    expect {airport.land(plane)}.to raise_error "Airport at capacity"
    end
  end  
  it 'raises an take off error when empty' do 
    airport = Airport.new
    expect {airport.take_off(Plane.new)}.to raise_error "No planes on the ground"
  end 
end