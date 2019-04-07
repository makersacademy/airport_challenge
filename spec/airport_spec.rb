require 'airport'
describe Airport do
  it "lands planes" do
    plane = Plane.new
    subject.land_plane(plane)
  end
  
  it "allows plane to take off" do
    plane = Plane.new
    expect(subject.plane_take_off(plane)).to eq false
  end

  it "prevents plane from taking off if weather is stormy" do
    plane = Plane.new
    expect(subject.prevent_take_off_if_stormy(plane)).to eq true
  end
end
