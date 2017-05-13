require 'weather'

describe Weather do
  it "Shows that weather responds to the show_current_weather_condition method" do
    expect(subject).to respond_to :show_current_weather_condition
  end
  it "Shows that the show_current_weather_condition method returns sunny" do
    expect(subject.show_current_weather_condition).to eq @current_weather_conditon
  end
end
