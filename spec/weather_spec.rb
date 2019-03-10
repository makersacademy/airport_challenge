require "weather"

describe Weather do
  it { is_expected.to respond_to("current_weather") }
  it "Returns either sunny or stormy when current_weather method is called" do
    expect(subject.current_weather).to eq("stormy").or(eq("sunny"))
  end
end
