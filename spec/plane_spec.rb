require 'plane'
describe Plane do
  
  it "should create plane as if its flying and not docked as default" do
    plane1 = Plane.new
    expect($flying_planes.include?(plane1)).to eq true
  end

end
