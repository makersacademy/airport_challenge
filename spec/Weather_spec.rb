require "./lib/Weather.rb"

describe Weather do
  subject(:weather) { described_class.new }

  describe "#test weather randomness" do
     it "should be occasionally stormy" do
       array = []
       100.times{array.push(Weather.new.bad?)}
       array.delete(true)
       expect(array.length).to be > 1
       expect(array.length).to be < 100
     end

  end
end


#investigate kernal for computer gen randomness
