require "Sky"

describe Sky do
  before do
    @sky = Sky.new
  end
  it "has weather that's either stormy or sunny" do
    100.times {
      @sky.change_weather
      expect(@sky.weather).to eq(:stormy).or eq(:sunny)
    }
  end

  it "has stormy weather if random rolls 1" do
    allow(@sky).to receive(:rand) { 1 }
    @sky.change_weather
    expect(@sky.weather).to eq :stormy
  end

  it "has sunny weather if random rolls 5" do
    allow(@sky).to receive(:rand) { 5 }
    @sky.change_weather
    expect(@sky.weather).to eq :sunny
  end
end
