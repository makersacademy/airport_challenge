require 'airport'

describe Airport do
  it "stores landed planes" do
    expect(subject.planes).to eq([])
  end
  it "lands planes" do
    expect(subject).to respond_to(:land).with(1).arguments
    plane = double(:plane)
    subject.land(plane)
    expect(subject.planes[0]).to eq(plane)
  end
end
