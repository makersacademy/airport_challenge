require "airport"
describe Airport do
  it "has a constant called DEFAULT_CAPACITY which is an integer" do
    expect(Airport::DEFAULT_CAPACITY).to be_a(Integer)
  end

  describe ".new" do
    it "should be an instance of the Airport class" do
      expect(Airport.new).to be_an_instance_of Airport
    end
    it "should have an attribute called @capacity which is equal to DEFAULT_CAPACITY" do
      expect(subject).to have_attributes(:capacity => Airport::DEFAULT_CAPACITY)
    end
  end

  describe ".takeoff" do
    it "should react to .takeoff" do
      expect(subject).to respond_to(:takeoff)
    end
    it "should fail when @planes is empty" do
      expect(subject.takeoff).to raise RuntimeError, "Takeoff not possible, as no planes present" if subject.instance_variable_get(:@planes).empty? && Weather.new.instance_variable_get(:@weather) == "Sunny"
    end
  end

  describe ".land" do
    it "should react to .land taking 1 argument" do
      expect(subject).to respond_to(:land).with(1).argument
    end
    it "should fail when airport is full" do
      expect(subject.land).to fail "Landing not possible. This airport is full." if Airport.send(:full?) && Weather.new.instance_variable_get(:@weather) == "Sunny"
    end
    it "should fail when weather is Stormy" do
      expect(subject.land).to fail "Landing not possible due to stormy weather"  if Airport.full? && Weather.new.instance_variable_get(:@weather) == "Stormy"
    end
  end

end
