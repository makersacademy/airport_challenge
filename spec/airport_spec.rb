require "airport"
describe Airport do 
  it "Creates Airport class" do
    airport = Airport.new
  end
  describe  "Creates landing method" do
    it { is_expected.to respond_to :landing }
  end
  describe  "Creates take_off method" do
    it { is_expected.to respond_to :take_off }
  end
  describe "Checks if plane takes off" do
  it "Checks if plane takes off" do 
    expect(subject.take_off).to be_truthy || be_false
  end
  end
  describe "Checks if plane lands" do
    it "Checks if plane lands" do 
      expect(subject.landing).to be_truthy || be_false
    end
  end
end