require 'airport'

describe Airport do

  let(:airbus747) { Plane.new }

  context 'during landing' do
    it { is_expected.to respond_to(:allows_for_landing).with(1).argument }

    it 'checks for landing permission' do
      subject.allows_for_landing(airbus747)
      expect(airbus747).to be_asking_for_permission
    end

    it 'puts plane into a hangar after landing' do
      subject.allows_for_landing(airbus747)
      expect(subject.hangar).to include(airbus747)
    end
  end

  context 'during take off' do
    it { is_expected.to respond_to(:allows_for_take_off).with(1).argument }

    it'checks for take off permission' do
      subject.allows_for_take_off(airbus747)
      expect(airbus747).to be_asking_for_permission
    end

    it 'updating hangar count after plane take off' do
      subject.allows_for_landing(airbus747)
      subject.allows_for_take_off(airbus747)
      expect(subject.hangar.size). to eq 0
    end

    it 'allows for take off only planes from the hangar' do
      tupolev102 = Plane.new
      subject.allows_for_landing(airbus747)
      subject.allows_for_landing(tupolev102)
      subject.allows_for_take_off(airbus747)
      expect(subject.hangar).not_to include(airbus747)
    end
  end

  context 'about an airport'
  it 'has a hangar' do
    expect(subject.hangar).to be_an_instance_of(Array)
  end
end
