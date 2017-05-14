require 'weather'

describe Weather do
  it "Shows that weather responds to the show_current_weather_condition method" do
    expect(subject).to respond_to :check_current_weather_condition
  end
  it "shows that the show_weather_condition method will return stormy 15% of the time and sunny otherwise" do
    1000.times do
      subject.stub(:change_weather_chance) { rand(85..100) }
      expect(subject.check_current_weather_condition).to eq "stormy"
      subject.stub(:change_weather_chance) { rand(1...85) }
      expect(subject.check_current_weather_condition).to eq "sunny"
    end
  end
end
