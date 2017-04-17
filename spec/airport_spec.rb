require './lib/airport'
require './lib/plane'
require './lib/weather'

describe Airport do
  it { is_expected.to be_instance_of(Airport) }
  it { is_expected.to respond_to(:landing).with(1).argument }
  it { is_expected.to respond_to(:hangar) }
  it 'has a default capacity' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end
  it 'has a @capacity variable which can be customized upon instantiation of class' do
    subject = Airport.new(20)
    expect(subject.capacity).to eq 20
  end
end
