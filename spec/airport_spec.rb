require 'airport'

describe '#land_a_plane' do
  it "lands a plane at an airport" do
    expect(Airport.new).to respond_to(:land_a_plane)
  end
end

describe '#land_a_plane' do
  it "lands a plane at an airport" do
    expect(Airport.new.land_a_plane("BA1")).to eq("BA1")
  end
end

describe '#land_a_plane' do
  it "lands a plane at an airport" do
    expect(Airport.new.land_a_plane("BA2")).to eq("BA2")
  end
end
