require "weather"

describe Weather do

  it "should either be stormy or not stormy" do
   expect(subject.weather_effect).to eq("stormy") | eq("not stormy")
  end

end
