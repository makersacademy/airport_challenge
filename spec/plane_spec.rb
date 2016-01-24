require 'plane'

describe Plane do
  describe '#land' do
    it do
      is_expected.to respond_to(:land).with(1).argument
    end
    it 'fails if not passed an Airport object' do
      expect { subject.land(Plane.new) }.to raise_error 'Must land at a valid airport'
    end
  end

  describe '#take_off' do
    it do
      is_expected.to respond_to(:take_off).with(1).argument
    end
    it 'fails if not passed an Airport object' do
      expect { subject.take_off(Plane.new) }.to raise_error 'Must take off from a valid airport'
    end
  end
  
  it 'lands at an airport and confirms it has landed' do
    subject.land(Airport.new)
    expect(subject).to be_landed
  end

  it 'takes off from an airport and confirms it is no longer landed' do
    subject.take_off(Airport.new)
    expect(subject).not_to be_landed
  end
end