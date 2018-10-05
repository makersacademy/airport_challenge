require 'airport'

describe Airport do
  it { is_expected.to respond_to :release_plane }

  it "releases a plane that has landed" do
    plane = subject.release_plane
    expect(plane).to be_landed    
  end

end
