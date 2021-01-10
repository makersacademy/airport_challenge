require 'weather'

describe Weather do

 describe "#stormy?" do 

  it "should return a true value if the random_weather is stormy" do
  expect(subject.stormy?).to eq true
  end

 end

 describe "#random_weather" do

 it "should return a value of stormy or sunny randomly" do
expect(subject.random_weather).to eq :stormy || :sunny
 end

end

end
