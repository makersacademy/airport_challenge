require 'weather'

describe Weather do

  describe "#request_weather" do
    it "responds to the request_weather method" do
      expect(subject).to respond_to(:request_weather)
    end

    it "returns the weather conditions at a specific airport" do
      expect(["sunny", "stormy"]).to include(subject.request_weather)
    end
  end

end
