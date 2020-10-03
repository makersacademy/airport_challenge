require 'airports'

describe Airports do

  it 'sets default plane capacity to 20 planes' do
    # This is only a test program, normally it would be more!
    expect(subject.capacity).to eq 20
  end

  describe '#full?' do

    it 'responds to full? method' do
      expect(subject).to respond_to(:full?)
    end
    it 'returns false when not full' do
      expect(subject.full?).to eq false
    end

    it 'returns true when full' do
      subject = Airports.new(0)
      expect(subject.full?).to eq true
    end
  end
end
