require 'airport'

describe Airport do

  it 'has a default capacity' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  let(:plane) {Plane.new}

  it 'should not let a plane land when its full' do
    expect(subject).to receive(:weather) {'clear'}
    expect(subject).to receive(:full?) {true}
    expect{subject.landing(plane)}.to raise_error 'The airport is full'
  end

  it 'should not let a plane to land when its stormy' do
    expect(subject).to receive(:weather) {'stormy'}
    expect{subject.landing(plane)}.to raise_error 'It is too stormy to land'
  end
end
