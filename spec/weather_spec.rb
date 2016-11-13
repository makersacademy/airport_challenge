require './lib/weather.rb'

describe Weather do
 context "randomising the weather" do
   it "should have weather options" do
     expect(subject.weathers).to eq [:Sunny, :Stormy, :Sunny, :Sunny]
   end

   it "should return the weather for today as a string" do
     expect(subject.todays_weather).to be_a(Symbol)
   end

   it "should return stormy when given number 1" do
     allow(subject).to receive(:randomise) {1}
     expect(subject.todays_weather).to eq :Stormy
   end

   it "should return sunny when given any number from 0-3 except for 1" do
     allow(subject).to receive(:randomise) {2}
     expect(subject.todays_weather).to eq :Sunny
   end
 end
end
