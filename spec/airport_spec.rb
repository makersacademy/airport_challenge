require 'airport'

describe Airport do
  let :plane {double :plane}
  it "stores landed planes" do
    subject.land(plane)
    expect(subject.planes[0]).to eq(plane)
  end
  it "releases planes after take-off" do
    subject.land(plane)
    subject.take_off(plane)
    expect(subject.planes).to eq([])
  end
  it "confirms last plane departed from airport" do
    expect(subject.departed?).to eq(true)
  end
end
