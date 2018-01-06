require 'weather'

describe Weather do
  context "Check stormy?" do
    it 'responds to stormy?' do
      expect(subject).to respond_to :stormy?
    end

    it "should be fine" do
      weather = Weather.new([:fine])
      expect(weather).not_to be_stormy
    end
  end
end
