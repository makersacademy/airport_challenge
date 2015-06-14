require 'airport'

describe Airport do

  it 'has a maximum capacity' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end


  describe 'take off' do
    it { is_expected.to respond_to :take_off }


  end

  describe 'landing' do
    it { is_expected.to respond_to(:landing).with(1).argument }

    it 'does not let planes land if the airport is full' do
      subject.capacity.times {subject.landing :plane}
      expect { subject.landing :plane }.to raise_error 'Airport full'
    end
  end


end
