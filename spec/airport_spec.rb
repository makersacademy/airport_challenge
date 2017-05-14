require 'airport'

describe Airport do

  it "Responds to 'land_plane' method" do
    expect(subject).to respond_to :land_plane
  end

  it "has variable to recieve and store planes" do
    expect(subject.planes).to eq []
  end


end
