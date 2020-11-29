 require "airport"
 require "plane"
#
describe Airport do


  it 'should land a plane' do
   allow(subject).to receive(:stormy?) { false }
   plane = Plane.new
  expect(subject.land(plane)).to eq [plane]
  end

  it 'should remove a plane from hanger after take-off' do
  allow(subject).to receive(:stormy?) { false }
  plane = Plane.new
  subject.land(plane)
  expect(subject.take_off(plane)).to eq [ ]
  end

  it 'should not land planes if weather is stormy' do
    airport = double(:airport, stormy?: true)
    expect { subject.land(Plane.new) }.to raise_error "Cannot land in the storm!"
  end

  it 'raises an error when full' do
    allow(subject).to receive(:stormy?) { false }
    subject.capacity.times { subject.land(Plane.new) }
    expect { subject.land(Plane.new) }.to raise_error 'Hanger is full'
  end

  it 'will accept a set capacity' do
   expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end
end
  #{airport.dock Plane.new}}.to raise_error StandardError}
#
#
#
