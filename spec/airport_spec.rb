require 'airport'
describe Airport do
  subject(:airport) { described_class.new }

 let(:airport1) { Airport.new }
 let(:plane_air) {double("plane", landed: false)}
 let(:plane_ground) {double("plane", landed: true)}

  it 'can create an airport' do
    expect(subject).to be_an_instance_of Airport
  end
  it 'has a default capacity' do
    expect(subject.capacity).to eq Airport::CAPACITY
  end
  it 'creates and empty airport' do
   expect(subject.plane_holder).to eq []
  end

  describe '#land' do
    before()
    it 'cant land twice without taking off' do
      allow(Weather).to receive(:weather?).and_return(false)
      allow(plane_air).to receive(:landed).and_return(true)
      expect{airport.land(plane_air)}.to raise_error("plane already landed")
    end
    it 'can land in clear weather' do
      allow(Weather).to receive(:weather?).and_return(false)
      allow(plane_air).to receive(:ground).and_return(true)
      airport.land(plane_air)
      expect(subject.plane_holder).to eq [plane_air]
    end
    it 'does not land in stormy weather' do
      allow(Weather).to receive(:weather?).and_return(true)
      expect{subject.land(plane_air)}.to raise_error("can't land in a storm")
      expect(subject.plane_holder).to eq []
    end
    it 'raises an error when the airport is full' do
      allow(Weather).to receive(:weather?).and_return(false)
       allow(plane_air).to receive(:ground).and_return(true)
      10.times {(subject.land(plane_air))}
      expect {subject.land(plane_air)}.to raise_error("can't airport full")
    end
    # it 'does not land when the airport is full' do
    #   11.times {(subject.land(plane_air))}
    #   expect(subject.plane_holder).to eq [plane_air,plane_air,plane_air,plane_air,
    #     plane_air,plane_air,plane_air,plane_air,plane_air,plane_air]
    # end
  end
   describe "#take_off" do
    it 'plane can take off' do
      subject.take_off(plane_ground)
      expect(subject.plane_holder).to eq []
    end
    it 'takes off in clear weather' do
      allow(Weather).to receive(:weather?).and_return(false)
      expect {subject.take_off(plane_air)}.not_to raise_error
    end
    it 'does not takes off if weather is stormy' do
      allow(Weather).to receive(:weather?).and_return(true)
      expect {subject.take_off(plane_ground)}.to raise_error

    end
  end
end