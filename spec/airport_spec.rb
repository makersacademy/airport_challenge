require 'airport'

describe Airport do
  let (:plane) {double :plane}
  let (:forecast) {double :forecast, :stormy? => false}

  it "allows planes to land and confirms" do
    expect(subject.land(plane, forecast)).to eq plane
  end

  it "stores landed airplanes" do
    subject.land(plane, forecast)
    expect(subject.planes).to include plane
  end

  it "allows planes to take off" do
    subject.land(plane, forecast)
    expect(subject.take_off(plane, forecast)).to eq plane
  end

  it "doesn't contain planes that did take off" do
    subject.land(plane, forecast)
    subject.take_off(plane, forecast)
    expect(subject.planes).not_to include plane
  end

  it "prevents landing when the airport is full" do
    35.times {subject.land(plane, forecast)}
    expect(subject.land(plane, forecast)).to eq false
  end

  it "allows to set a capacity for airports" do
    airport = Airport.new(15)
    expect(airport.capacity).to eq 15
  end

  describe "behaviour during stormy weather" do
    let (:forecast) {double :forecast, :stormy? => true}

    it "prevents taking off when weather is stormy" do
      subject.land(plane, double(:stormy? => false))
      expect{subject.take_off(plane, forecast)}.to raise_error
    end

    it "prevents landing when weather is stormy" do
      expect{subject.land(plane, forecast)}.to raise_error
    end


  end

end
