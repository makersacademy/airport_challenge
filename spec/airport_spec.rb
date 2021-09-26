require "airport"

describe Airport do
  it { is_expected.to respond_to(:full?) }

  describe "#plane_landed" do
    it { is_expected.to respond_to(:plane_landed) }

    it "doesn't let a plane land, when the airport is full" do
      airport = Airport.new(10)
      10.times { airport.plane_landed }
      expect { airport.plane_landed }.to raise_error "Airport is full"
    end
  end
  describe "#full?" do
    it { is_expected.not_to be_full }

    it "is full after a plane has landed" do
      subject.plane_landed
      expect(subject).to be_full
    end

    it "is possible to set a certain capacity to an airport" do
      airport = Airport.new(10)
      5.times { airport.plane_landed }
      expect(airport).not_to be_full
    end
  end
end
