require 'weather'

RSpec.describe Weather do
  let(:dummy_class) { Class.new { include Weather } }
  let(:subject) { dummy_class.new }
  describe ".check" do
    it "shows the weather" do
      expect(subject).to receive(:rand).and_return(0)
      expect(subject.check_weather).to eq :sunny
    end

    it "randomizes the weather to sometimes be stormy" do
      expect(subject).to receive(:rand).and_return (10)
      expect(subject.check_weather).to eq :stormy
      
      expect(subject).to receive(:rand).and_return (8)
      expect(subject.check_weather).to eq :stormy

      expect(subject).to receive(:rand).and_return (7)
      expect(subject.check_weather).to eq :sunny    
    end
  end
end
