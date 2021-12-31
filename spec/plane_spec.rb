require "plane"

describe Plane do
  describe "#initialize" do
    it "sets @location to :air" do
      expect { (subject.location).to eq (:air) }
    end
  end

  describe "#ground" do
    it { is_expected.to respond_to(:ground) }

    it "changes @location to :ground" do
      subject.ground
      expect { (subject.location).to eq (:ground) }
    end
  end

  describe "#air" do
    it { is_expected.to respond_to(:air) }

    it "changes @location to :air" do
      subject.ground
      subject.air
      expect { (subject.location).to eq (:air) }
    end
  end
  
end
