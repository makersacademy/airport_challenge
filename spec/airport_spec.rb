require 'airport'

describe Airport do

  it "Responds to 'land_plane' method" do
    expect(subject).to respond_to :land_plane
  end

  it 'has variable to recieve and store planes' do
    expect(subject.planes).to eq []
  end

  it "Adds 'plane' to '@planes' when passed to 'land_plane'" do
    plane = double(:plane)
    expect(subject.land_plane(plane)).to eq [plane]
  end

  it "Responds to 'confirm_landing' method" do
    expect(subject).to respond_to :confirm_landing
  end

end
