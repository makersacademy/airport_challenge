require 'airport'
describe Airport do

 let(:plane) {double("plane")}

  it 'can create an airport' do
    expect(subject).to be_an_instance_of Airport
  end
  describe '#land' do
    # it 'can land a plane' do
    #   subject.land(plane)
    #   expect(subject.plane_holder).to eq [plane]
    # end
     it 'does not land in stormy weather' do
        allow(subject).to receive(:land).and_raise("can't land in a storm")
        expect{subject.land(plane)}.to raise_error("can't land in a storm")
        expect(subject.plane_holder).to eq []
    end
     it 'does not land when the airport is full' do
        #allow(subject).to receive(:land).and_return(false)
        subject.land(plane)
        expect(subject.plane_holder).to eq []
    end


  end
   describe "#take_off" do
      it 'plane can take off' do
        allow(subject).to receive(:land).and_return(false)
        subject.land(plane)
         allow(subject).to receive(:take_off).and_return(false)
        subject.take_off(plane)
        expect(subject.plane_holder).to eq []
      end



      it 'takes off in clear weather' do
      allow(subject).to receive(:take_off).and_return(false)
      expect {subject.take_off(plane)}.not_to raise_error
      end
      it 'does not takes off if weather is stormy' do
        allow(subject).to receive(:take_off).and_raise("can't fly in storm")
        expect {subject.take_off(plane)}.to raise_error("can't fly in storm")
    end
end
  #  describe '#landed?' do
  #   it 'can check a plane has landed' do
  #      expect(airport).to eq(plane)
  #   end
  # end

end