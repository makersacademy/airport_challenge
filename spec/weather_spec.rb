require 'weather'

describe Weather do
  it "Shows that weather responds to the show_current_weather_condition method" do
    expect(subject).to respond_to :show_current_weather_condition
  end
  it "Shows that an instance of the Weather class responds to a change_weather_condition method" do
    expect(subject).to respond_to :change_weather_condition
  end
  it "shows that by default the current_weather_conditon instance variable is set to sunny" do
    expect(subject.show_current_weather_condition).to eq "sunny"
  end
  # it "shows that instances of weather have a change weather chance method" do
  #   expect(subject).to respond_to :change_weather_chance
  # end
  # it "shows that the change_weather_chance method returns an instance variable called" do
  #   expect(subject.change_weather_chance).to eq 50
  # end
  it "shows that the change_weather_condition method will change the current_weather_conditon instance variable to stormy based on the value of weather_chance instance variable" do
    subject.change_weather_condition
    expect(subject.show_current_weather_condition).to eq "stormy"
  end
  it "shows that the change_weather_condition method will return stormy if weather_chance > 85 and sunny otherwise" do
    20.times do
      subject.stub(:change_weather_chance) {rand(85...100)}
      expect(subject.change_weather_condition).to eq "stormy"
      subject.stub(:change_weather_chance) {rand(1..85)}
      expect(subject.change_weather_condition).to eq "sunny"
    end
  end
end
