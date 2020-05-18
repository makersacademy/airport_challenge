require 'airport'


describe Airport do

  it 'should instruct a plane to land at an airport' do
expect(subject).to respond_to(:land).with(1).argument
  end

  it 'should instruct a plane to take off from an airport and confirm empty' do
expect(subject).to respond_to(:take_off).with(1).argument
  end

   describe '#land' do
    it 'raises an error when full' do
      subject.land(Plane.new)
      expect { subject.land Plane.new }.to raise_error 'Airport full'
    end
  end

  # it 'airport capacity that can be overridden' do
  # expect(subject).to respond_to(:capacity).with(1).argument
  # end

  it 'airport capacity that can be overridden' do
  expect(subject).to respond_to(:capacity).with(1).argument
  end

end
