require 'plane'

describe Plane do
  it { is_expected.to respond_to :at_airport? }
  describe '#at_airport?' do
    it "returns true when plane is at airport" do
      airport = Airport.new
      hangar = @hangar
      expect(subject).to be_at_airport if hangar.include?(subject)
    end
  end
end
  