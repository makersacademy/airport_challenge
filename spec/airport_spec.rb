require 'airport'

describe Airport do
  it "should be able to create an instance of Airport" do
    expect(Airport).to respond_to(:new)
  end

  it { is_expected.to respond_to(:land_plane) }
  
  it "accept one argument when land_plane" do
    expect(subject).to respond_to(:land_plane).with(1).argument 
  end
end
