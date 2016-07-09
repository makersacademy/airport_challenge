require 'airport'

describe Airport do
  #Reduntant tests (kept for reference):
  #it { is_expected.to respond_to(:land).with(1).argument }

  it 'instructs a plane to land at airport and confirms it has landed' do
    plane = Plane.new
    expect(subject.land(plane)).to eq("Plane #{plane} has landed.")
  end
  it 'instructs a plane to take off from airport and confirms it is in the air' do
    plane = Plane.new
    expect(subject.take_off(plane)).to eq ("Plane #{plane} is in the air.")
  end

  it 'prevents landing if weather is stormy' do
    plane = Plane.new
    subject.stormy
    expect{subject.land(plane)}.to raise_error("Abort landing. Stormy weather.")
  end

  it 'prevents take off when weather is stormy' do
    plane = Plane.new
    subject.stormy
    expect{subject.take_off(plane)}.to raise_error("Abort take off. Stormy weather.")
  end
end
