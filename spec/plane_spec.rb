require 'plane'

describe Plane do
  it { is_expected.to respond_to(:flying?, :land, :take_off, :current_airport) }
  it "requires an airport at creation" do
    expect(subject.current_airport).not_to eq nil
  end

  describe "#take off" do
    
    it "sets plane flying" do
      subject.take_off(double("airport"))
      expect(subject).to be_flying
    end

    it "removes any current airport data" do
      subject.take_off(double("airport"))
      expect(subject.current_airport).to eq nil
    end

  end
end