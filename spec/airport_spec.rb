require 'airport'

describe Airport do
  it "creates an airport and lands planes" do
    plane = Plane.new
    expect(subject.land(plane)).to eq [plane]
  end

  it "instructs plane to take off and confirm it`s no longer there" do
    plane = Plane.new
    expect(subject.takeoff(plane)).to eq(nil)
  end

  it "prevents landing of planes when capacity is full" do
    airport = Airport.new
    plane = Plane.new
    # expect { (subject.land(plane)) > airport.capacity }.to raise_error { RuntimeError }
    expect { airport.land(plane) > :cap }.to raise_error { RuntimeError }
  end

  it 'allows the default airport capacity to be overridden' do
    airport = Airport.new
    # expect(:cap).to eq(:capacity_change)
    # expect(:cap).to be(:capacity_change)
    expect {
      subject.capacity_change(capacity)
    }.to change {:cap}.from(10).to(:capacity)
  end
end
