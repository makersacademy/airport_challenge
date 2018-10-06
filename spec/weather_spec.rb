describe 'Weather' do

  it "The weather is usually sunny, and sometimes stormy" do
    today = Weather.new
    10.times { puts today.weather_conditions }
    expect(today.weather_conditions).to eq("sunny").or eq ("stormy")
  end
end
