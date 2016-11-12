require 'flying'

describe Flying do

  it "should show that there is a response between flying class and take off method" do
    expect(subject).to respond_to :take_off
  end

  it "should show that a plane has been selected" do
  saa_plane = Plane.new
  expect(subject.take_off(saa_plane)).to eq saa_plane
end

end
