require "Airport"

describe Airport do
  describe "#plane_landed" do
  it {is_expected.to respond_to :plane_landed }
  it { expect(subject.plane_landed).to be_a Plane }
end
end
