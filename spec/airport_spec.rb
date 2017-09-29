require 'airport'

describe Airport do
  it "shoule be able to land a plane" do
  expect(subject).to respond_to(:land_plane).with(1).argument
  end
end
