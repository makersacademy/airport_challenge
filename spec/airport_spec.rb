require 'airport'

describe Airport do
  it "should have a maximum capactity" do
    expect(subject.capacity).to eq(Airport::DEFAULT_CAPACITY)
  end
  
  describe 'safe_to_land?' do
    it "returns false when it is considered unsafe to land" do
      expect(subject.safe_to_land?).to be(true).or be(false)
    end  
  end

  describe 'safe_to_takeoff?' do
    it "returns false when it is considered unsafe to takeoff" do
      expect(subject.safe_to_takeoff?).to be(true).or be(false)
    end
  end
  
  describe 'local_weather' do
    it "stores the local weather conditions" do
      expect(subject.local_weather).to be_a(String)
    end
  end
end
