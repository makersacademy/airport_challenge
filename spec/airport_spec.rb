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


end
