require 'plane'

describe Plane do
  let(:plane) { Plane.new }

  it { expect(plane).to respond_to :land }
  it 'should land if weather is not stormy' do
    allow(plane.land).to receive(:stormy?) { false }
    expect(plane.land).to be
  end
  it 'should not land if weather is stormy' do
    allow(plane.land).to receive(:stormy?) { true }
    expect { plane.land }.to raise_error 'Weather Stormy'
  end

  it { expect(plane).to respond_to :take_off }
end
