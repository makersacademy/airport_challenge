require 'airport'

describe Airport do

  it { is_expected.to respond_to(:allows_for_landing).with(1).argument }

  it 'checks for permission' do
    airbus747 = Plane.new
    subject.allows_for_landing(airbus747)
    expect(airbus747).to be_asking_for_permission
  end

  it 'takes plane' do
    airbus747 = Plane.new
    expect(subject.allows_for_landing(airbus747)).to eq airbus747
  end

  it { is_expected.to respond_to(:allows_for_take_off) }

  it'checks for permission' do
    airbus747 = Plane.new
    subject.allows_for_landing(airbus747)
    airbus747 = subject.allows_for_take_off
    expect(airbus747).to be_asking_for_permission
  end

  it { is_expected.to respond_to(:plane) }

  it 'has a hangar' do
    expect(subject.hangar).to be_an_instance_of(Array)
  end

  it 'puts plane into a hangar after landing' do
    airbus747 = Plane.new
    subject.allows_for_landing(airbus747)
    expect(subject.hangar).to include(airbus747)
  end

  it 'updating hangar count after plane take off' do
    airbus747 = Plane.new
    subject.allows_for_landing(airbus747)
    subject.allows_for_take_off
    expect(subject.hangar.size). to eq 0
  end
end
