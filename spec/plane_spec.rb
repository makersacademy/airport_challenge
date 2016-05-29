require 'plane'

describe Plane do

  context 'Responds to' do

    it '#land' do
      expect(subject).to respond_to :land
    end

    it '#take_off' do
      expect(subject).to respond_to :take_off
    end

    it '#landed?' do
      expect(subject).to respond_to :landed?
    end

  end

  context '#land' do
    it 'lands at an airport and becomes landed' do
      airport = Airport.new
      subject.land(airport)
      expect(subject.landed?).to eq true
    end

  end

  context '#take_off' do
    it 'takes off from an airport and becomes not landed' do
      airport = Airport.new
      subject.land(airport)
      subject.take_off(airport)
      expect(subject.landed?).to eq false
    end
  end
end
