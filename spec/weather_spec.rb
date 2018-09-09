require 'weather.rb'

describe Weather do

  describe "initialize" do
    it "checks whether weather is stormy" do
      allow(subject).to receive(:initialize).and_return("sunny", "stormy")
    end
  end

end
