require "plane"
describe Plane do
  it { expect(subject).to respond_to :take_off, :land, :flying? }

  it "should not be flying when initialized" do
    expect(subject.flying?).to eq false
  end

  describe "#take_off" do
    it "should set @flying as true" do
      subject.take_off
      expect(subject).to be_flying
    end
  end

  describe "#land" do
    it "should set @flying as false" do
      subject.take_off
      subject.land
      expect(subject).not_to be_flying
    end
  end
end