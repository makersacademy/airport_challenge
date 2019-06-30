require 'weather'
# the weather class doesn't have any dependencies
# weather is selected at random from an array using
# the .sample method. If the weather is stormy, the attribute
# .safe? will be set to false
describe Weather do
  it "should assign itself a value on initialisation" do
    expect(subject.outlook).not_to be nil
  end
  describe '#safe?' do
    it "safe? should be false if weather is stormy" do
      weather = double( :weather)
      allow(weather).to receive(:safe?).and_return(false)
      expect(weather.safe?).to be false
    end
  end
end
