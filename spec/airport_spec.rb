require 'airport'
describe Airport do
it "instructs the plane to land" do
    expect(subject).to respond_to(:land_plane).with(1).argument
  end
end