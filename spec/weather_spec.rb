require './lib/weather.rb'

describe Weather do

  context "make sure the method right_now is working correctly" do

    it "expects that if right now is called either Sunny or Stormy is called" do
      expect(subject.right_now).to eq("Sunny") | eq("Stormy")
    end

    
end
