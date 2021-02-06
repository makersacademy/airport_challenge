require 'airport'

describe Airport do
  let(:subject) { Airport.new }
  let(:plane) { Plane.new }

  it '#land allows plane to land at airport' do
    expect(subject).to respond_to(:land)
  end

  it '#land increases number of planes in the airport' do
    expect { subject.land(plane) }.to change { subject.planes.length }.from(0).to(1)
  end

  it '#takeoff decrease number of planes in the airport' do
    expect {subject.takeoff }.to change { }
  end
end

describe Plane do
  let(:plane) { Plane.new }

  it 'plane class exists in program' do
    expect(plane).to be_a(Plane)
  end
end
