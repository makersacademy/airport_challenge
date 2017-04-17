require 'plane'

describe Plane do
  subject(:plane) {described_class.new}
  let(:airport) {double :airport}

  context 'it has the basic methods expected of it' do
    it{is_expected.to respond_to(:land)}
    it{is_expected.to respond_to(:takeoff)}
  end

  context '...and those methods do what they are supposed to' do

    it 'the .land method raises an error when the landing strip at the target Airport is full' do
      allow(airport).to receive(:sunny?).and_return(true)
      allow(airport).to receive(:full?).and_return(true)
      expect{subject.land(airport)}.to raise_error
    end

    it 'the .land method raises an error when the weather at the landing Airport is not sunny' do
      allow(airport).to receive(:sunny?).and_return(false)
      expect{subject.land(airport)}.to raise_error
    end

    it 'the .takeoff method raises an error when the weather at the Airport is not sunny' do
      allow(airport).to receive(:sunny?).and_return(false)
      expect{subject.takeoff}.to raise_error
    end

  end

end
