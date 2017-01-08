
require 'airport'
require 'plane'

describe Airport do
  it {is_expected.to respond_to(:land).with(1).argument}
  it {is_expected.to respond_to(:take_off).with(1).argument}
  it {is_expected.to respond_to(:full?)}
  it {is_expected.not_to respond_to(:planes)}
  it {is_expected.not_to respond_to(:weather)}

  it 'should return an error when the airport is full' do
    plane = Plane.new
    allow(subject).to receive(:stormy?) {false}
    subject.capacity.times{subject.land plane}
  end


  it 'return error when the weather is bad to land' do
    plane = Plane.new
    allow(subject).to receive(:stormy?) {true}
    message = 'You cannot land due to bad weather'
    expect { subject.land(plane) }.to raise_error message
  end

  it 'return error when the weather is bad to take_off' do
    plane = Plane.new
    allow(subject).to receive(:stormy?) {true}
    message = 'You cannot take_off due to bad weather'
    expect { subject.take_off(plane) }.to raise_error (RuntimeError)
 end


  it 'allow plane to land after storm has cleared' do
    plane = Plane.new
    allow(subject).to receive(:stormy?) {false}
    expect { subject.land(plane) }.not_to raise_error
  end

end
