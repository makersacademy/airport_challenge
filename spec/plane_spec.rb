require "plane"

describe Plane do

  describe "#initialize" do
    it "sets @location to :air" do
      expect { (Plane.new.location).to eq (:air) }
    end

  end

  describe "#grounded" do
    it "responds to grounded" do
      expect { subject.to respond_to(:grounded) }
    end

    it "changes @location to :grounded" do
      subject.ground
      expect { (subject.location).to eq (:grounded) }
    end

  end

  describe "#air" do
    it "responds to air" do
      expect { subject.to respond_to(:air) }
    end

    it "changes @location to :air" do
      subject.ground
      subject.air
      expect { (subject.location).to eq (:air)}
    end

  end
  
end
