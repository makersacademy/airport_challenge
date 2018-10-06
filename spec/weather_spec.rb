require 'weather.rb'

describe Weather do
  it { is_expected.to respond_to :sunny?}

  describe "#report_storm" do
    it "can report a storm" do
      subject.report_storm
      expect(subject.sunny?).to be false
    end
  end
end
