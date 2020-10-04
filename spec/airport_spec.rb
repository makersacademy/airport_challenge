require 'airport'

describe Airport do

  let(:airbus747) { double :plane }

  before do
    allow(airbus747).to receive(:asking_for_permission?).and_return(true)
  end

  context 'during landing' do
    it 'checks for landing permission' do
      subject.landing(airbus747)
      expect(airbus747).to be_asking_for_permission
    end

    it 'gives permistion to landing' do
      expect(subject.giving_permition_for_landing(airbus747)).to eq true
    end

    it { is_expected.to respond_to(:landing).with(1).argument }

    it 'puts plane into a hangar after landing' do
      subject.landing(airbus747)
      expect(subject.hangar).to include(airbus747)
    end

    it 'return error when airport is full' do
      2.times { subject.landing(Plane.new) }
      expect { subject.landing(Plane.new) }.to raise_error 'No space available'
    end
  end

  context 'during take off' do
    it { is_expected.to respond_to(:take_off).with(1).argument }

    it'checks for take off permission' do
      subject.take_off(airbus747)
      expect(airbus747).to be_asking_for_permission
    end

    it 'gives permistion for take off' do
      expect(subject.giving_permition_for_take_off(airbus747)).to eq true
    end

    it 'updating hangar count after plane take off' do
      subject.landing(airbus747)
      subject.take_off(airbus747)
      expect(subject.hangar.size). to eq 0
    end

    it 'allows for take off only planes from the hangar' do
      tupolev102 = double :plane
      allow(tupolev102).to receive(:asking_for_permission?).and_return(true)
      subject.landing(airbus747)
      subject.landing(tupolev102)
      subject.take_off(airbus747)
      expect(subject.hangar).not_to include(airbus747)
    end
  end

  context 'about an airport'
  it 'has a hangar' do
    expect(subject.hangar).to be_an_instance_of(Array)
  end

  it { is_expected.to respond_to :capacity }

  it 'has a variable capacity' do
    london_heathrow = Airport.new(50)
    50.times { london_heathrow.landing airbus747 }
    expect { london_heathrow.landing airbus747 }.to raise_error 'No space available'
  end
end
