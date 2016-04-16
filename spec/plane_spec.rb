require "plane"
describe Plane do
  it { expect(subject).to respond_to :flying? }

  it "should not be at an airport when initialized" do
    expect(subject.flying?).to eq true
  end

  describe "#land" do
    it "should set @flying as false" do
      subject.land
      expect(subject).not_to be_flying
    end
  #   it "should raise an error if @flying is false" do
  #     expect { subject.land }.to raise_error "This plane isn't flying!"
  #   end
  end
end