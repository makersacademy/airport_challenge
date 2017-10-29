require "weather"

describe Weather do

  let(:weather) { Weather.new }

  it "can be initiated" do
    expect(weather).to be_an_instance_of(Weather)
  end

  it "when initiated stores a weather variable with a float" do
    expect(weather.storm_chance).to be_kind_of(Float)
  end

  # it "expects stormy to return true when storm_chance>0.9" do
  #   allow(weather).to receive(:storm_chance).and_return(1)
  #   p "HERE", weather.stormy?
  #   expect(weather.stormy?).to eq true
  # end
  #
  # it "expects stormy to return false when storm_chance<0.9" do
  #   allow(weather).to receive(:storm_chance).and_return(0.5)
  #   p "HERE", weather.stormy?
  #   expect(weather.stormy?).to eq false
  # end

end
