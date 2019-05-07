require 'plane'

describe 'Plane' do 
  let(:plane) { Plane.new("AF_3026") }
  let(:airport) { double :airport }

  it "can land at airport" do
    expect(plane.land(airport))
  end
  
end
