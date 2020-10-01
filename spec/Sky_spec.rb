require "Sky"

describe Sky do
  before do
    @sky = Sky.new
  end
  it "can check the weather" do
    100.times { expect(@sky.check_weather).to eq("stormy").or eq("sunny") }
  end
end
