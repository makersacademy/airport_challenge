require 'plane'

describe Plane do

  describe '#is_flying?' do
    it "is deafultly flying" do
      expect(subject.is_flying?).to eq true
    end
    it "can be landed" do
      subject = Plane.new(false)
      expect(subject.is_flying?).to eq false
    end
  end
end
