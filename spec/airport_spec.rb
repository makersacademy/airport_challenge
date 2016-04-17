require 'airport'
describe Airport do

 let(:plane_fine) {double("plane", weather?: false)}
 let(:plane_storm) {double("plane", weather?: true)}

  it 'can create an airport' do
    expect(subject).to be_an_instance_of Airport
  end
  it 'has a default capacity' do
    expect(subject.capacity).to eq Airport::CAPACITY
  end

  describe '#land' do
    # it 'can land a plane' do
    #   subject.land(plane)
    #   expect(subject.plane_holder).to eq [plane]
    # end
    it 'can land in clear weather' do
        expect(subject.plane_holder).to eq []
        subject.land(plane_fine)
        expect(subject.plane_holder).to eq [plane_fine]
    end
     it 'does not land in stormy weather' do
        #allow(subject).to receive(:land).and_raise("can't land in a storm")
        expect{subject.land(plane_storm)}.to raise_error("can't land in a storm")
        expect(subject.plane_holder).to eq []
    end
     it 'does not land when the airport is full' do
        #allow(subject).to receive(:land).and_return(false)
        #allow(subject).to receive(:land).and_return(false)
        10.times {(subject.land(plane_fine))}

        expect {subject.land(plane_fine)}.to raise_error("can't airport full")
        expect(subject.plane_holder).to eq [plane_fine,plane_fine,plane_fine,plane_fine,plane_fine,plane_fine,plane_fine,plane_fine,plane_fine,plane_fine]
    end

# decribe "#full?" do
#   it 'will return a boolean true if the plane plane_holder array is bigger than the capacity' do
#      10.times (subject.land(plane))
  # end
   end
   describe "#take_off" do
      it 'plane can take off' do
        #allow(subject).to receive(:land).and_return(false)
      subject.land(plane_fine)
         #allow(subject).to receive(:take_off).and_return(false)
      subject.take_off(plane_fine)
      expect(subject.plane_holder).to eq []
      end



      it 'takes off in clear weather' do
      # allow(subject).to receive(:take_off).and_return(false)
      expect {subject.take_off(plane_fine)}.not_to raise_error
      end
      it 'does not takes off if weather is stormy' do
      #allow(subject).to receive(:take_off).and_raise("can't fly in storm")
      # expect {subject.take_off(plane)}.to raise_error("can't fly in storm")
       #expect {subject.take_off(plane_storm)}.to raise_error
       subject.land(plane_fine)
       expect {subject.take_off(plane_storm)}.to raise_error
       expect(subject.plane_holder).to eq [plane_fine]


    end
end
  #  describe '#landed?' do
  #   it 'can check a plane has landed' do
  #      expect(airport).to eq(plane)
  #   end
  # end

end