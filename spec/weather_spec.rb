require './docs/weather'

describe Weather do 
  it "responds to stromy method" do
    expect(subject).to respond_to(:weather_check)
  end   
end 