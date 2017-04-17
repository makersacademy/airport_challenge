require './lib/weather.rb'

describe Weather do

    it "test if weather is stormy" do
      weather = Weather.new
      expect(subject.stormy).to be(true).or be(false)
    end

end
