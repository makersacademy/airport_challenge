require './lib/plane'

describe Plane do
  it { is_expected.to be_instance_of(Plane) }
  it { is_expected.to respond_to(:land) }
  it { is_expected.to respond_to(:takeoff) }
  describe '#land' do
    it 'should return landing confirmation' do
      expect(subject.land).to eq 'Plane landed safely'
    end
  end
  describe '#takeoff' do
    it 'should return takeoff confirmation' do
      expect(subject.takeoff).to eq 'Plane takeoff succesful'
    end
  end
end
