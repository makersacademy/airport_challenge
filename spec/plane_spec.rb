require 'plane.rb'
require 'rspec/expectations'

describe Plane do
   it { expect(subject).to respond_to :took_off, :landed}

  describe "#initialize" do
    it "has a variable landed when initialize and it is set to false" do
      expect(subject.landed?).to eq true
    end
  end
  describe '#took_off?' do
    it "expects a variable landed to be false if the plane is took off as it hasn't landed" do
      subject.took_off
      expect(subject.landed?).to eq false
    end
  end
  describe '#landed?' do
    it "expects to check the status of the plane to be landed when called up on" do
        subject.landed
        expect(subject.landed?).to eq true
    end
  end
end
