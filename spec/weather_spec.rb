require "class_weather"
describe Weather do 
  it "generates weather with sunny and stormy" do
    expect([:sunny, :stormy]).to include(subject.weather) 
  end
end
