require 'airport'

describe Airport do
  it "creates with a default capacity" do
    expect(subject.capacity).to eq(50)
  end

  it "creates with a custom capacity" do
    expect(Airport.new(400).capacity).to eq(400)
  end

  it "contains an array for planes to land, empty by default" do
    expect(Airport.new.planes).to eq([])
  end
end