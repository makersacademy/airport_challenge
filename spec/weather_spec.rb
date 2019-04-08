require 'weather'

describe Weather do

  class DummyClass
  end

  before(:each) do
    @dummy_class = DummyClass.new
    @dummy_class.extend(Weather)
  end

  describe "#generate_weather" do
    it "randomly generates the weather and describes it" do
      allow(@dummy_class).to receive(:rand).and_return(1)
      expect(@dummy_class.generate_weather).to eq "Stormy"
      allow(@dummy_class).to receive(:rand).and_return(2..10)
      expect(@dummy_class.generate_weather).to eq "Clear skies"
    end
  end

end
