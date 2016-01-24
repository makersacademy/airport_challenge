require "./lib/weather.rb"

describe Weather do
  subject(:weather) { described_class.new }

  describe "#test weather randomness" do
    it "should be occasionally stormy (fail)" do
      array = []
      100.times{array.push(Weather.new.bad?)}
      array.delete(true)
      expect(array.length).to be > 2
      expect(array.length).to be < 40
    end

  end
end
