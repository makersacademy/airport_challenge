require 'weather'

describe Weather do

  describe "#sunny" do

    it {is_expected.to respond_to(:sunny?)}

    it "Will be Sunny roughly 90% of the time" do
      true_false_array = []
      100.times do
        subject.sunny? ? true_false_array << "sunny" : nil
      end
      expect(true_false_array.size).to satisfy{|x| x >= 80 }
    end
  end
end
