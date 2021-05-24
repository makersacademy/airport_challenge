require 'weather'

RSpec.describe Weather do 
  describe "generate" do
    it "can create stormy weather by returning a value > 4" do
      allow(Kernel).to receive(:rand).and_return(5)
      expect(subject.generate).to eq(5)
    end

    it "can create sunny weather by returning a value < 4" do
      allow(Kernel).to receive(:rand).and_return(2)
      expect(subject.generate).to eq(2)
    end
  end

end