require 'weather'

describe Weather do
  let(:weather) { Weather.new }
  it { is_expected.to respond_to(:check) }
  describe "#check" do
    it "check returns Stormy when rand number is above 94 e.g.99" do
      expect_any_instance_of(Object).to receive(:rand).with(100).and_return(99)
      expect(weather.check).to eq("Stormy")
    end
  end
  it "check returns Clear when rand number is below 95 e.g.21" do
    expect_any_instance_of(Object).to receive(:rand).with(100).and_return(21)
    expect(weather.check).to eq("Clear")
  end
end
