require 'airport'
require 'plane'

describe Airport do
  plane = Plane.new
  plane2 = Plane.new
  it 'lets the plane land' do
    expect(subject.land(plane)).to include plane
  end

  it 'lets the plane takes off' do
    subject.land(plane)
    subject.land(plane2)
    expect(subject.take_off(plane2)).to eq plane2
  end

  it 'raises error when plane takes off at airport with no planes' do
    expect{subject.take_off(plane)}.to raise_error('Sorry no planes to take off')
  end

  it 'raises error when plane that has not landed trying to take off' do
    subject.land(plane)
    expect{subject.take_off(plane2)}.to raise_error('This plane is not at the airport')
  end

  it 'raises error when landing the same plane multiple times' do
    subject.land(plane)
    expect{subject.land(plane)}.to raise_error('Sorry this plane has already landed')
  end

  it 'checks if sepecific plane has landed' do
    subject.land(plane)
    expect(subject.check(plane)).to eq true
  end

  it 'checks if specific plan has taken off' do
    subject.land(plane)
    subject.take_off(plane)
    expect(subject.check(plane)).to eq false
  end

  #it 'prevents landing if weather is stormy' do
    #weather = 'stormy'
    #expect{subject.land(plane)}.to raise_error('Stormy weather, can\'t land')
  #end
end
