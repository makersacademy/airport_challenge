require './lib/plane'

describe Plane do
  it { is_expected.to be_instance_of(Plane) }
  it { is_expected.to respond_to(:landing_confirmation) }
  it { is_expected.to respond_to(:takeoff_confirmation) }
  describe '#landing_confirmation' do
    it 'should return landing confirmation' do
      expect(subject.landing_confirmation).to eq 'Plane landed safely'
    end
  end
  describe '#takeoff_confirmation' do
    it 'should return takeoff confirmation' do
      expect(subject.takeoff_confirmation).to eq 'Plane takeoff succesful'
    end
  end
  describe '#landing_problem' do
    it 'should return takeoff confirmation' do
      expect(subject.landing_problem).to eq 'Unable to land'
    end
  end
  describe '#takeoff_problem' do
    it 'should return takeoff confirmation' do
      expect(subject.takeoff_problem).to eq 'Unable to takeoff'
    end
  end
end
