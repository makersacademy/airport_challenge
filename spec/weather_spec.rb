require './docs/weather'

describe Weather do 
  it "responds to stromy method" do
    expect(subject).to respond_to(:weather_check)
  end
 
  it "returns stormy when it is stormy" do
    srand(90)
    expect(subject.weather_check).to eq("stormy")
  end

  it "returns stormy when it is stormy" do
    srand(89)
    expect(subject.weather_check).to eq("sunny")
  end
  
end 

