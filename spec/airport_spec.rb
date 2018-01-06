require 'airport'

describe Airport do

  let (:plane) {double("plane")}

  it 'Can create a new airport' do
    expect(subject).to eq subject
  end

  it 'Responds to land method with plane as an argument' do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it 'Allows a plane to be stored in the hanger' do
    expect(subject.land(plane)).to eq [plane]
  end

  it 'Doesn\'t allow the same plane to be put in the hanger' do
    subject.land(plane)
    expect{subject.land(plane)}.to raise_error("#{plane} is already in the hanger")
  end

  it 'Allows a plane to take off and confirms it has left the hanger' do
    subject.land(plane)
    expect(subject.takeoff(plane)).to eq "#{plane} has left the hanger!"
  end

  it 'Doesn\'t allow a plane to take off if it\'s not in the hanger' do
    expect{subject.takeoff(plane)}.to raise_error("#{plane} is not in the hanger")
  end

end
