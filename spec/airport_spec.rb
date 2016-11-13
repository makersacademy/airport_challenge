require 'airport'

describe Airport do

  it "confirms a plane has landed" do
    expect(Airport.new).to respond_to :land_plane
    #it { is_expected.to respond_to :land_plane }
  end

  it "allows a plane to land" do
    plane = (Airport.new).land_plane
    expect(plane).to be_landed
  end

end
