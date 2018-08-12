describe Weather do
  describe "#check" do
    it "returns the weather today" do
      subject.generate
      expect(subject.today).to eq("Stormy").or(eq("Sunny"))
    end
  end
end
