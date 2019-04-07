require 'airport'
describe Airport do
  it "lands planes" do
    plane = Plane.new
    subject.land_plane(plane)
  end
  
  it "allows plane to take off" do
    plane = Plane.new
    subject.plane_take_off(plane)
    expect(subject.plane_take_off(plane)).to eq false
  end

  describe "prevents plane from taking off if weather is stormy" do
    it { is_expected.to respond_to :no_take_off_if_stormy }
  end
end
