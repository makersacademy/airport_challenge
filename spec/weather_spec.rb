require 'weather'

describe Weather do
  it "Shows that weather responds to the show_current_weather_condition method" do
    expect(subject).to respond_to :show_current_weather_condition
  end
  it "Shows that the show_current_weather_condition method returns sunny" do
    expect(subject.show_current_weather_condition).to eq @current_weather_conditon
  end
  it "Shows that an instance of the Weather class responds to a change_weather_condition method" do
    expect(subject).to respond_to :change_weather_condition
  end
  it "shows that by default the current_weather_conditon instance variable is set to sunny" do
    expect(subject.current_weather_conditon).to eq "sunny"
  end
  it "shows that the change_weather_condition method will change the current_weather_conditon instance variable to sunny" do
    subject.change_weather_condition
    expect(subject.show_current_weather_condition).to eq "sunny"
  end
end
