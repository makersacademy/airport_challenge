require 'plane'

describe Plane do

  describe '#is_flying?' do
    it "is deafultly flying" do
      expect(subject.is_flying).to eq true
    end
    it "can be landed" do
      subject.landed
      expect(subject.is_flying).to eq false
    end
    it "can take off" do
      subject = Plane.new(false)
      subject.taken_off
      expect(subject.is_flying).to eq true
    end
  end
end
