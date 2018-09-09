require "weather"
describe Weather do
  let(:fake_weather) { Weather.new }

  it "has a status" do
    expect(subject.storm_scale).to be_an(Integer)
  end
end
