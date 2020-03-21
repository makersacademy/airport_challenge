require 'plane'

describe Plane do
  it 'can be instructed to land at an airport' do
    expect(subject).to respond_to(:land).with(1).argument
  end

  context 'taking off' do
    it 'can be instructed to take off from an airport' do
      expect(subject).to respond_to(:take_off)
    end

    it 'confirms it is no longer in the airport after it has taken off' do
      expect(subject.take_off).to eq "No longer in the airport"
    end
  end
end
