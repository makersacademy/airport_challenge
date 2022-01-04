require "weather"
describe Weather do 
  it {should respond_to(:todays_weather)}

  it "generates todays weather" do 
    new_weather = Weather.new
    expect(new_weather.todays_weather).to be_between(0, 7) 
  end 
  
end 
