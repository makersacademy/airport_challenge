require 'weather'

describe Weather do
  subject(:weather) {Weather.new}

  it "checks for stormy weather" do
    allow(subject).to receive(:weather_now) {0}
    expect(subject.stormy?).to eq(true)
    allow(subject).to receive(:weather_now) {1}
    expect(subject.stormy?).to eq(false)
  end
  
end
