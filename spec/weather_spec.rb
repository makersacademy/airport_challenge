require 'weather'

describe Weather do

  describe "#conditions" do
    it ".conditions - returns true or false" do
      expect(subject.conditions).to be(:sunny).or be(:stormy)
    end
  end

end
