require_relative '../lib/airport'

describe Airport do

  subject(:airport) { described_class.new }
  DEFAULT_CAPACITY = 10

  it 'should create an empty plane list when instantiated' do
    expect(subject.planes).to eq []
  end

  it 'should set capacity to default if capacity was specified' do
  expect(subject.capacity).to eq DEFAULT_CAPACITY
  end

  it { is_expected.to respond_to(:full?)}

  it { is_expected.to respond_to(:track).with(1).argument }

  it 'should return true when full' do
    planes = double(:planes, count: 10)
    expect(subject.full?).to eq true
  end

  it 'should add the plane to planes list when it lands' do
    plane = double(:plane, status: :landed)
    subject.track plane
    expect(subject.planes).to include plane
  end

  it 'should delete the plane from planes list when it takes off' do
    plane = double(:plane, status: :taken_off)
    subject.planes << plane
    subject.track plane
    expect(subject.planes).not_to include plane
  end

end
