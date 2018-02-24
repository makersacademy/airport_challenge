require 'airport'
require 'plane'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double :plane }
  it 'instructs a plane to land' do
    expect(airport).to respond_to(:instruct_landing).with(1).argument
  end

  it 'instructs a plane to take off' do
    expect(airport).to respond_to(:instruct_take_off).with(1).argument
  end

  it 'does not let planes land as airport capacity is reached' do
    20.times { airport.instruct_landing(plane) }
    expect { airport.instruct_landing(plane) }.to raise_error 'Cannot land. Airport is full'
  end

  # it 'shows plane that has taken off' do
  #   airport.instruct_landing(plane)
  #   expect(plane).to receive(:instruct_take_off)
  #   airport.instruct_take_off(plane)
  # end

end
