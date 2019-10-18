require "weather"

describe Weather do
  let(:weather) { Weather.new }

  it "successfully instantiates the weather class" do
    expect(weather).to be_instance_of(Weather)
  end

  it { is_expected.to respond_to :forecast }

  it { is_expected.to respond_to :magic_8_ball }

  it { is_expected.to respond_to :good_weather? }
end
