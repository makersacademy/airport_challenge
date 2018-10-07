require 'airport'
require 'plane'

describe Airport do
  let(:plane1) { double :plane1 }
  let(:plane2) { double :plane2 }
  let(:plane3) { double :plane3 }

  it 'allows a plane to land' do
    allow(subject).to receive(:safe_to_land) { true }
    allow(plane1).to receive(:flying=)
    subject.land_plane(plane1)
    expect(subject.terminal).to eq [plane1]
  end

  it 'allows multiple planes to land' do
    allow(subject).to receive(:safe_to_land) { true }
    allow(plane1).to receive(:flying=)
    allow(plane2).to receive(:flying=)
    subject.land_plane(plane1)
    subject.land_plane(plane2)
    expect(subject.terminal).to eq [plane1, plane2]
  end

  it 'allows planes to to take off & confirm they have left the airport' do
    allow(subject).to receive(:safe_to_land) { true }
    allow(subject).to receive(:safe_to_take_off) { true }
    allow(plane1).to receive(:flying=)
    allow(plane2).to receive(:flying=)
    allow(plane3).to receive(:flying=)
    subject.land_plane(plane1)
    subject.land_plane(plane2)
    subject.land_plane(plane3)
    expect(subject.take_off(plane1)).to eq "#{plane1} has left the #{subject}"
    expect(subject.take_off(plane3)).to eq "#{plane3} has left the #{subject}"
    expect(subject.terminal).to eq [plane2]
  end

  it 'should only allow planes at the airport to take off' do
    allow(subject).to receive(:stormy) { false }
    allow(plane1).to receive(:flying=)
    allow(plane2).to receive(:flying=)
    allow(plane1).to receive(:flying) { true }
    allow(plane2).to receive(:flying) { true }
    subject.land_plane(plane1)
    allow(plane1).to receive(:flying) { false }
    subject.take_off(plane1)
    expect { subject.take_off(plane1) }.to raise_error("#{plane1} is not at this airport")
    expect { subject.take_off(plane2) }.to raise_error("#{plane2} is not at this airport")
  end

  it 'should not allow planes at the airport to land again' do
    allow(subject).to receive(:stormy) { false }
    allow(plane1).to receive(:flying) { true }
    allow(plane1).to receive(:flying=)
    subject.land_plane(plane1)
    allow(plane1).to receive(:flying) { false }
    expect { subject.land_plane(plane1) }.to raise_error("#{plane1} is already at the airport")
  end

  it 'should not allow planes that have landed at another airport to land again' do
    allow(subject).to receive(:stormy) { false }
    allow(plane1).to receive(:flying=)
    airport = Airport.new
    another_airport = Airport.new
    allow(plane1).to receive(:flying) { true }
    another_airport.land_plane(plane1)
    allow(plane1).to receive(:flying) { false }
    expect { airport.land_plane(plane1) }. to raise_error("#{plane1} is not flying.")
  end

  it 'refuses further landings when airport is at capcity' do
    plane1 = Plane.new
    10.times { subject.land_plane(Plane.new) }
    expect(subject.land_plane(plane1)).to eq "#{plane1} cannot land. #{subject} is at capacity."
  end

  it 'refuses landings when the weather is stormy' do
    allow(subject).to receive(:stormy) { true }
    allow(plane1).to receive(:flying) { true }
    expect(subject.land_plane(plane1)).to eq "#{plane1} cannot land. Weather is too stormy."
  end

  it 'refuses take offs when the weather is stormy' do
    allow(subject).to receive(:stormy) { false }
    allow(plane1).to receive(:flying) { true }
    allow(plane1).to receive(:flying=)
    subject.land_plane(plane1)
    allow(subject).to receive(:stormy) { true }
    expect(subject.take_off(plane1)).to eq "#{plane1} cannot take off. Weather is too stormy."
  end

end
