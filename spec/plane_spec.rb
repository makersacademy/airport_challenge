require 'plane'

describe Plane do

  context "When testing with landing scenario" do

    it "should be able to respond to land method" do
      expect(subject).to respond_to :land
    end

    it "should be able to respond to is_stormy?" do
      expect(subject).to respond_to :is_stormy?
    end
    it "should return true if the weather is stormy" do
      expect(subject.is_stormy?).to eq true
    end
  end

  context "When testing with taking off scenario" do

    it "should be able to respond to take_off method" do
      expect(subject).to respond_to :take_off
    end

  end

end
