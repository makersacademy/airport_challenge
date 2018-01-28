require 'weather'

describe Weather do

  subject(:weather) { described_class.new }
  # let(:weather) { double :weather, stormy?: false }


  it 'creates a new instance' do
    expect(subject).to be_a Weather
  end

  # it { is_expected.to respond_to(:stormy?) } 
  
  # it 'is not stormy' do
  # allow(weather).to receive(:stormy?).and_return(false)
  # expect(subject.stormy).to eq(false)
  # end

  # # expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  # # it { is_expected.to respond_to(:random_weather) }
end
