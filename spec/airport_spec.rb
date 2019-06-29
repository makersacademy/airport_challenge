require 'Airport'
describe Airport do
  it "responds to a land_plane method" do
    expect(subject).to respond_to(:land_plane).with(1).argument
  end
end
