require 'weather'

describe Weather do

  describe "#generate" do
    it "generates a random number" do
      expect(subject.generate).to be_between(1, 10)
    end
  end

end
