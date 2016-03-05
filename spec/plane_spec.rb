require 'plane'

describe Plane do
  let(:airport){double(:airport)}

  describe "#land" do
    it {is_expected.to respond_to(:land)}
  it "reports its initial flying status" do
    expect(subject.flying).to be(false)
  end
  it "confirms flying after takeoff" do
    subject.takeoff
    expect(subject.flying).to be(true)
  end
  it "confirms landed after landing" do
    subject.takeoff
    subject.land
    expect(subject.flying).to be(false)
  end
end

end
