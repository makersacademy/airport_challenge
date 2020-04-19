require 'atc'

RSpec.describe ATC do
  describe '#land_plane' do
    it "shows 'land plane at airport'" do
      subject = described_class.new
      expect(subject.land_plane).to eq("land plane at airport")
    end
  end

  describe '#take_off_plane' do
    it "shows 'prepare plane for take-off'" do
      expect(subject.take_off_plane).to eq("prepare plane for take-off")
    end
  end

  describe '#confirm_take_off' do
    it "shows 'plane is no longer at the airport'" do
      expect(subject.confirm_take_off).to eq("plane is no longer at the airport")
    end
  end

  describe '#cancel_take_off' do
    it "shows 'plane cannot take off'" do
      expect(subject.cancel_take_off).to eq("plane cannot take off")
    end
  end

  describe '#cancel_landing' do
    it "shows 'plane cannot land'" do
      expect(subject.cancel_landing).to eq("plane cannot land")
    end
  end
end
