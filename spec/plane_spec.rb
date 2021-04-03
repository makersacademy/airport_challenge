require 'plane'
describe Plane do
  it { is_expected.to be_instance_of(Plane) }
  describe "#land" do
    it { expect(subject).to respond_to(:land) }
  end
end
