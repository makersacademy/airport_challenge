require "atc.rb"

describe Atc do
  
  describe "#check_location" do
    it "returns location of airplane" do
    atc = Atc.new
    expect(atc).to respond_to(:check_location).with(1).arguments
    end
  end

  describe "#instruct_landing" do
    it "instructs a plane to land at airport" do
    atc = Atc.new
    expect(atc).to respond_to(:instruct_landing).with(2).arguments
    end
  end
  

end

