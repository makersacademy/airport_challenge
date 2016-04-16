require 'plane.rb'
require 'rspec/expectations'

describe Plane do
   it { expect(subject).to respond_to :took_off?, :reported_landed}

  describe "#initialize" do
    it "has a variable landed when initialize and it is set to false" do
      expect(subject.landed?).to eq false
    end
  end
  describe '#took_off?' do
    it "expects a variable landed to be false if the plane is took off as it hasn't landed" do
      subject.took_off?
      expect(subject.landed?).to eq false
    end
  end
  describe '#landed?' do
    it "expects to check the status of the plane to be landed when called up on" do
        is_expected.to respond_to(:landed?)
    end
  end

  describe '#reported_landed' do
    it "expects a plane land attribute to be true after a plane has reported landed" do
      subject.reported_landed
      expect(subject.landed?).to eq true
    end
  end
end
