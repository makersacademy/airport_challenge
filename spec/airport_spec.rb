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
      @weather = Weather.new(0)
      @planes = Airport.new.instance_variable_get(:@planes)
      expect(subject.takeoff).to raise RuntimeError, "Takeoff not possible, as no planes present" if @planes.empty? && @weather == "Sunny"
    end
    it "should fail when weather is Stormy" do
      @weather = Weather.new(1)
      @planes = Airport.new.instance_variable_get(:@planes)
      expect(subject.takeoff).to raise RuntimeError, "Takeoff not possible. Weather is stormy" if !@planes.empty? && @weather == "Stormy"
    end
  end

  describe ".land" do
    it "should react to .land taking 1 argument" do
      expect(subject).to respond_to(:land).with(1).argument
    end
    it "should fail when airport is full" do
      @weather = Weather.new(0)
      expect(subject.land).to fail "Landing not possible. This airport is full." if :full == true && @weather == "Sunny"
    end
    it "should fail when weather is Stormy" do
      @weather = Weather.new(1)
      expect(subject.land).to fail "Landing not possible due to stormy weather" if :full == false && @weather == "Stormy"
    end
  end

end
