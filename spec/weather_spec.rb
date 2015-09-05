require 'weather'

describe Weather do
  it { is_expected.to respond_to(:condition) }

  describe "#condition" do
    it "creates a weather condition using random number" do
      expect(subject.condition).to be_an_instance_of(Fixnum)
    end
  end
end
