require 'weather'

describe Weather do
  it "checks for stormy weather" do
    allow(subject).to receive(:weather_now) {0}
    expect(subject.stormy?).to eq(true)
    allow(subject).to receive(:weather_now) {1}
    expect(subject.stormy?).to eq(false)
  end
end
