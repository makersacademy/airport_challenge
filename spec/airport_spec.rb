require 'airport'

describe Airport do
  let :plane {double :plane}


  it "stores landed planes" do
    subject.land(plane)
    expect(subject.planes[0]).to eq(plane)
  end

  context "plane landed then departed" do
    it "releases planes after take-off" do
      allow(subject).to receive(:stormy?) { false }
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.planes).to eq([])
    end

    it "confirms last plane departed from airport" do
      allow(subject).to receive(:stormy?) { false }
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.departed?(plane)).to eq(true)

    end
  end

  it "prevents take-off in stormy weather" do
    allow(subject).to receive(:stormy?) { true }
    subject.land(plane)
    expect {subject.take_off(plane)}.to raise_error("Cannot take-off during a storm")
  end

  it "won't allow landing after capacity reached" do
    Airport::DEFAULT_CAPACITY.times {subject.land(plane)}
    expect {subject.land(plane)}.to raise_error("Airport full")
  end

  it "has an adjustable plane capacity" do
    subject = Airport.new(0)
    expect(subject.capacity).to eq(0)
  end
end
