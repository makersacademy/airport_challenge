require 'weather'

describe Weather do
  describe "#random_weather" do
    it "randomly creates a weather" do
      srand(25)
			expect(subject.random_weather).to eql("sunny")
    end
  end
end