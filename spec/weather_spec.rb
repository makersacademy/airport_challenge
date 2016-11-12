require 'weather'

describe Weather do
  it "should create an object" do
    expect(subject).to be_a(Object)
  end
  it "should contain a radom_weather method" do
    expect(subject).to respond_to(:random_weather)
  end
   it "random_weather should return either stormy or sunny" do
      expect(subject.random_weather).to match(/[sunnystormy]/)
   end
   it "random_weather should return either stormy or sunny" do
      expect(subject.random_weather).to match(/[sunnystormy]/)
   end

end
