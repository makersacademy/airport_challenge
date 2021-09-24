require 'weather'

RSpec.describe Weather do
  let(:dummy_class) { Class.new { extend Weather} }

  describe ".check" do
    it "shows the weather" do
      expect(dummy_class).to receive(:rand).and_return(0)
      expect(dummy_class.check_weather).to eq "sunny"
    end

    it "randomizes the weather to sometimes be stormy" do
      expect(dummy_class).to receive(:rand).and_return (1)
      expect(dummy_class.check_weather).to eq "stormy"
      
      expect(dummy_class).to receive(:rand).and_return (0.76)
      expect(dummy_class.check_weather).to eq "stormy"

      expect(dummy_class).to receive(:rand).and_return (0.5)
      expect(dummy_class.check_weather).to eq "sunny"    
    end
  end
end