require 'airport'

describe Airport do
  let :plane {double :plane}
  it "stores landed planes" do
    subject.land(plane)
    expect(subject.planes[0]).to eq(plane)
  end
  it "releases planes after take-off" do
    expect(subject).to respond_to(:take_off)
  end
end
