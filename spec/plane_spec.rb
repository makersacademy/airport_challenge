require 'plane'

describe Plane do

  describe '#land' do

    it 'is expected to respond to #landed? with true if landed' do
      subject.land
      expect(subject.landed?).to eq true
    end

    it 'is expected to respond to #landed? with false if not landed' do
      subject.landed = false
      expect(subject.landed?).to eq false
    end
end

  describe '#take_off' do

  it 'is expected to respond to #landed? with false when it takes off' do
    subject.take_off
    expect(subject.landed?).to eq false
  end
end

end
