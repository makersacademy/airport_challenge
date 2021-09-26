require 'airport'
require 'plane'

describe Airport do 
  it { is_expected.to respond_to(:land).with(1).argument }

  it 'expects a plane to land at an aiport' do
    airport = Airport.new
    plane = Plane.new
    expect(airport.land(plane)).to eq([plane])
  end 
end

describe "#take_off" do 
  it 'expects instances of Airport class to respond to the take_off method' do 
    plane = Plane.new
    expect(Airport.new).to respond_to(:take_off)
  end 
end