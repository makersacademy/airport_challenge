require 'airport'
describe Airport do
  subject(:airport) { described_class.new }


 let(:plane_fine) {double("plane", weather: false, ground: true)}
 let(:plane_storm) {double("plane", weather: true, ground: true)}

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

    it 'can land in clear weather' do
      subject.land(plane_fine)
      expect(subject.plane_holder).to eq [plane_fine]
    end
    it 'does not land in stormy weather' do
      expect{subject.land(plane_storm)}.to raise_error("can't land in a storm")
      expect(subject.plane_holder).to eq []
    end
    it 'raises an error when the airport is full' do
      10.times {(subject.land(plane_fine))}
      expect {subject.land(plane_fine)}.to raise_error("can't airport full")
    end
    # it 'does not land when the airport is full' do
    #   11.times {(subject.land(plane_fine))}
    #   expect(subject.plane_holder).to eq [plane_fine,plane_fine,plane_fine,plane_fine,
    #     plane_fine,plane_fine,plane_fine,plane_fine,plane_fine,plane_fine]
    # end
  end
   describe "#take_off" do
    it 'plane can take off' do
      subject.land(plane_fine)
      subject.take_off(plane_fine)
      expect(subject.plane_holder).to eq []
    end
    it 'takes off in clear weather' do
      expect {subject.take_off(plane_fine)}.not_to raise_error
    end
    it 'does not takes off if weather is stormy' do
     subject.land(plane_fine)
     expect {subject.take_off(plane_storm)}.to raise_error
     expect(subject.plane_holder).to eq [plane_fine]
    end
  end
end