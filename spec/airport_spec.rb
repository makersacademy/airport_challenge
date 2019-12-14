require 'airport'
require 'plane'

describe Airport do
  it { is_expected.to respond_to :land }
  describe 'land' do
    it "lands a plane in the airport" do
      plane = Plane.new
      expect(subject.land(plane)).to eq @plane
    end
  end
  describe 'hangar' do
    it "returns landed planes" do
      plane = Plane.new
      subject.land(plane)
      expect(subject.hangar).to eq @plane
    end
  end
  describe 'full' do
    it "prevents landing when airport is full" do
      expect { subject.full }.to raise_error "Can't land, airport full"
    end
  end
  describe 'clear?' do
    it "returns false when the weather it stormy" do
      expect(subject).to_not be_clear
    end
  end
  describe 'no_landing' do
    it "prevents planes from landing when stormy" do
      expect { subject.no_landing }.to raise_error "Can't land, stormy"
    end
  end
      
end
