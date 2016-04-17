require 'plane'

describe Plane do
let(:airport) { double(:airport, park: nil)}

  describe '#land' do

it { is_expected.to respond_to(:land).with(1).argument }

    it 'is expected to respond to #landed? with true if landed' do
      subject.land(airport)
      expect(subject.landed?).to eq true
    end

    it 'is expected to respond to #landed? with false if not landed' do
      subject.landed = false
      expect(subject.landed?).to eq false
    end

    it 'is expected to raise an error if weather is stormy' do
      subject.stormy = true
      expect {subject.land(:airport)}.to raise_error("It is too stormy to land")

  end

    # raise an error if plane already landed



end

  describe '#take_off' do

  it 'is expected to respond to #landed? with false when it takes off' do
    subject.take_off
    expect(subject.landed?).to eq false
  end

  it 'is expected to raise an error if weather is stormy' do
    subject.stormy = true
    expect {subject.take_off}.to raise_error("It is too stormy to take off")
  end

  # raise an error if plane already taken off
end

end
