require "airport"

describe Airport do

  subject(:airport) { described_class.new }
  let(:plane) { double :plane }

  it "confirm plane has landed" do
    Airport.stub(:weather) do |w|
      expect(airport.land(plane)).to eq [plane] if w_is true
    end
  end

  it "confirm plane has taken off" do
    Airport.stub(:weather) do |w|
      if w_is true
        airport.land(plane)
        expect(airport.take_off(plane)).to eq [plane]
      end
    end
  end

  it "if stormy, plane does NOT take off" do
    Airport.stub(:weather) do |w|
      expect(airport.take_off(plane)).to eq "The skies are dark, best to stay on the ground" if w_is true
    end
  end

  it "If stormy, plane does NOT land" do
    Airport.stub(:weather) do |w|
      expect(airport.land(plane)).to eq "Got a storm front coming, cannot land here" if w_is true
    end
  end

  it "raises an error if terminal is full" do
    Airport.stub(:weather) do |w|
      if w_is true
        Airport::DEFAULT_CAPACITY.times { airport.land(plane) }
        expect { airport.land(plane) }.to raise_error("Airport is full")
      end
    end
  end
end
