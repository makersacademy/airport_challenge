# should airport be responsible for checking that objects trying to land at it are planes or should planes
# be expected to check they are trying to land at airport objects? Probably both?

require 'airport'
describe Airport do
  let(:plane) {double :plane}
  it "can accept planes landing" do
    expect(subject.plane_landing(plane).planes).to eq [plane]
  end

  it "can be told plane is taking off and remove plane" do
    expect(subject.plane_landing(plane).plane_taking_off(plane).planes).to eq []
  end

  it "can accept planes being entering system on the ground at airports" do
    expect(subject.plane_entering_on_ground(plane).planes).to eq [plane]
  end
end
