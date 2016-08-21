require 'airport'

describe Airport do
  let (:plane) {double :plane, :flying? => false}
  let (:flying_plane) {double :flying_plane, :flying? => true}

  let (:forecast) {double :forecast, :stormy? => false}

  it "allows planes to land and confirms" do
    expect(subject.land(flying_plane, forecast)).to eq flying_plane
  end

  it "stores landed airplanes" do
    subject.land(flying_plane, forecast)
    expect(subject.planes).to include flying_plane
  end

  it "allows planes to take off" do
    expect(subject).to respond_to(:take_off).with(2).arguments
  end

  it "prevents landing when the airport is full" do
    35.times {subject.land(flying_plane, forecast)}
    expect(subject.land(flying_plane, forecast)).to eq false
  end

  it "allows to set a capacity for airports" do
    airport = Airport.new(15)
    expect(airport.capacity).to eq 15
  end

  describe "behaviour during stormy weather" do
    let (:forecast) {double :forecast, :stormy? => true}

    it "prevents taking off when weather is stormy" do
      subject.land(double(:flying? => true), double(:stormy? => false))
      expect{subject.take_off(double(:flying? => false), forecast)}.to raise_error
    end

    it "prevents landing when weather is stormy" do
      expect{subject.land(plane, forecast)}.to raise_error
    end
  end

  describe "behaviour for edge cases" do
    it "doesn't allow planes already flying to take off" do
      expect{subject.take_off(double(:flying? => true), forecast)}.to raise_error
    end
    it "doesn't allow planes landed to land again" do
      expect{subject.land(double(:flying? => false), forecast)}.to raise_error
    end

  end

end
