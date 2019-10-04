require "airport"
#require "plane"

describe Airport do

 it { is_expected.to respond_to(:airport) }
end

describe Airport do

    it "should be able to land a plane" do
    plane = Plane.new
    subject.land(plane)

    expect(subject.airport).to eq([plane])


  end

    it "can take off" do
    plane = Plane.new
    subject.land(plane)
    expect(subject.take_off).to eq (plane)
  end
    describe "take_off" do
      it 'shows when there are no more planes in the airport' do
      expect{subject.take_off}.to raise_error('there are no more planes in the airport')
    end
  end
    

end
