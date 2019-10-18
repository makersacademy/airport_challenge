# Final Version

require "weather"

describe Weather do
  let(:weather) { Weather.new }

  it "successfully instantiates the weather class" do
    expect(weather).to be_instance_of(Weather)
  end

  it { is_expected.to respond_to :forecast }

  it { is_expected.to respond_to :magic_8_ball }

  it { is_expected.to respond_to :good_weather? }

  it "returns a random number between 1 and 100 when calling magic_8_ball" do
    expect(subject).to receive(:rand).and_return(50)
    expect(subject.magic_8_ball).to eq 50
  end

  it "returns safe when the magic_8_ball is less than 90" do
    allow(weather).to receive(:magic_8_ball).and_return(89)
    expect(weather.good_weather?).to be(true)
  end

  it "returns stormy when the magic_8_ball is 90" do
    allow(weather).to receive(:magic_8_ball).and_return(90)
    expect(weather.good_weather?).to be(false)
  end

  it "returns stormy when the magic_8_ball is more than 90" do
    allow(weather).to receive(:magic_8_ball).and_return(90)
    expect(weather.good_weather?).to be(false)
  end

  it "allows the weather to receive a random number for the forecast" do
    allow(weather).to receive(:magic_8_ball).and_return(1)
  end

  it "good_weather? is true when forecast is safe" do
    allow(weather).to receive(:forecast).and_return("Safe")
    expect(weather.good_weather?).to be(true)
  end

  it "good_weather? is false when forecast is stormy" do
    allow(weather).to receive(:forecast).and_return("Stormy")
    expect(weather.good_weather?).to be(false)
  end
end
