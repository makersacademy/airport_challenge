require 'airport'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double :plane }
  it 'instructs a plane to land' do
    # airport = Airport.new
    # plane = Plane.new
  expect(airport).to respond_to(:land).with(1).arguments
  end

  it 'instructs a plane to take off' do
    # airport = Airport.new
    # plane = Plane.new
    subject.land(plane)
    expect(subject).to respond_to(:take_off).with(1).arguments
  end

  # it 'prevents take off if stormy' do
  #   # airport = Airport.new
  #   # plane = Plane.new
  #   subject.land(plane)
  #   allow(airport).to receive(:stormy?).and_return true
  #   expect { subject.take_off(plane) }.to raise_error 'cannot take of, weather is stormy'
  # end

end
