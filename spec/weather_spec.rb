describe Weather do
  describe "#today" do
    it "returns the weather today" do
      subject.generate
      expect(subject.today).to eq("Stormy").or(eq("Sunny"))
    end
  end
  describe "#generate" do
    it "randomly generates weather" do
      expect(subject.generate).to eq("Stormy").or(eq("Sunny"))
    end
  end
end
