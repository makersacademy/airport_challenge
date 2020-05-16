require 'weather'

describe Weather do
    let(:subject) { Weather.new }
  describe "#weather" do
  it { is_expected.to respond_to :weather }

  it "have weather conditions" do
    expect(subject.weather).to eq ["sunny","sunny","stormy"]
  end

  it "should give current weather conditions" do
    expect(subject.current_weather).to eq "sunny"
  end
  end
end
