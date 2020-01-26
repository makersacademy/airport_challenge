require 'airport'

describe Airport do

  it { is_expected.to respond_to :land_plane }

  it "should return plane" do
    subject.land_plane
    # expect(subject.land_plane).to eq plane
  end

end
