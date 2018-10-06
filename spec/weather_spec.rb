require 'weather.rb'

describe Weather do
  it { is_expected.to respond_to :stormy?}

  describe "#report_storm" do
    it "can report a storm" do
      subject.report_storm
      expect(subject.stormy?).to be true
    end
  end
end
