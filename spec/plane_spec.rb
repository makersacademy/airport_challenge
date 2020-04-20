require './docs/airport'
require './docs/plane'

describe Plane do 
  let(:airport) { Airport.new }
  let(:plane) { Plane.new }


  it "Plane responds to landing" do 
    expect(plane).to respond_to(:land)
  end 

  it "Plane responds to taking off method" do 
    expect(plane).to respond_to(:takeoff)
  end 

  it "Plane responds to flying method" do 
    expect(plane).to respond_to(:flying)
  end 

  it "Assigns airport to plane when landing" do
    plane.land(aiport)
    expect(plane.location).to eq (airport)
  end


end 