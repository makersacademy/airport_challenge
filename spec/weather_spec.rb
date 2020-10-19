require "./lib/weather.rb"

RSpec.describe Weather do
  let(:subject) { Weather.new }
  describe "#random" do
    it "generates a random number between 1 and 4" do
      allow(subject).to receive(:rand).and_return(3)
      expect(subject.random).to eq 3
    end
  end
  describe "#condition" do
    it "assigns weather as stormy" do
      allow(subject).to receive(:condition).and_return("stormy")
      expect(subject.condition).to eq "stormy"
    end
  end
  it "assigns weather as sunny" do
    allow(subject).to receive(:condition).and_return("sunny")
    expect(subject.condition).to eq "sunny"
  end
end
