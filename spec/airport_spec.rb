require 'airport'

describe Airport do
  it 'asks a plane to land' do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it 'asks a plane to take off' do
    expect(subject).to respond_to(:take_off).with(1).argument
  end

  it 'will not take off a plane if it is stormy' do
    plane = Plane.new
    allow(subject).to receive(:stormy?) { true }
    expect { subject.take_off(plane) }.to raise_error('Plane cannot take off because it is stormy')
  end

  it 'will not land a plane if it is stormy' do
    plane = Plane.new
    allow(subject).to receive(:stormy?) { true }
    expect { subject.land(plane) }.to raise_error('Plane cannot land because it is stormy')
  end

  # it '#stormy? returns a number between 1 and 10' do
  #   expect(subject.stormy?).to be_between(1, 10)
  # end

  # it '#stormy? returns true if response is above 7' do
  #   allow(subject).to receive(:stormy?).and_return(8)
  #   # expect(subject.stormy?).to eq true
  #
  # end
end
