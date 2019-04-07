require 'weather'

describe Weather do

  describe "generate_weather" do
    it "randomly generates the weather and describes it" do
      allow(subject).to receive(:rand).and_return(1)
      expect(subject.generate_weather).to eq "Stormy"
      allow(subject).to receive(:rand).and_return(2..10)
      expect(subject.generate_weather).to eq "Clear skies"
    end
  end

end
