require "weather"

describe Weather do
  it "reports stormy" do
    allow(subject).to receive(:weather_report).and_return(:stormy)
    expect(subject).to be_stormy
  end

  [:clear, :cloudy, :rain].each do |weather|
    it "doesn't report stormy when #{weather}" do
      allow(subject).to receive(:weather_report).and_return(weather)
      expect(subject).not_to be_stormy
    end
  end
end
