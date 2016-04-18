require 'plane'
require 'rspec/expectations'

describe Plane do
	it {is_expected.to respond_to(:flying)}
  
  describe "#land" do
    it "lands the plane" do
      subject.land
      expect(subject.flying).to eq false
      end
    end

  describe "#take_off" do
    it "takes off" do
      subject.land
      subject.take_off
      expect(subject.flying).to eq true
    end
  end
end

