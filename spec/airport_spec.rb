require 'airport'

describe Airport do

  it "confirms a plane has landed" do
    expect(Airport.new).to respond_to :land_plane
    #it { is_expected.to respond_to :land_plane }
  end

end
