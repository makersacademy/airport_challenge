require 'airport'

describe Airport do
  describe '#instruct_to_land' do
    it {is_expected.to respond_to :instruct_to_land}

    it 'should land a plane' do
      plane = double(:plane, in_airport_status: false, land: true)
      subject.instruct_to_land(plane)
      expect(subject.landed_planes).to eq [plane]
    end

    it 'should check that the plane is in the airport' do
      plane = double(:plane, in_airport_status: false, land: true)
      subject.instruct_to_land(plane)
      expect(subject.landed_planes).to eq [plane]
    end

    it "it should change the plane's status to 'in airport'" do
      plane = double(:plane, in_airport_status: true, land: true)
      plane.land
      expect(plane.in_airport_status).to eq true
    end

    it "it should raise an error if the plane is in the airport" do
      plane = double(:plane, in_airport_status: true)
      expect{ subject.instruct_to_land(plane) }.to raise_error "The plane is already in the airport"
    end
  end

  describe '#instruct_take_off' do
    it {is_expected.to respond_to :instruct_take_off}

    it 'should let a plane take off' do
      plane = double(:plane, in_airport_status: false, take_off: false)
      subject.landed_planes << plane
      subject.instruct_take_off
      expect(subject.landed_planes).not_to eq [plane]
    end

    it 'should raise an error if no planes are available to take off' do
      landed_planes = []
      expect { subject.instruct_take_off }.to raise_error "There are no planes in the airport"
    end

    it "should change the plane's status to not in airport" do
      plane = double(:plane, in_airport_status: false)
      expect(plane.in_airport_status).to eq false
    end
  end

  describe '#weather' do
    it 'should generate a number to indicate weather' do
      subject.weather
      test_values = [1,2,3,4,5]
      Kernel.stub!(:rand).and_return(*test_values)
  #    Kernel.expects(:rand).with(4).returns(1)
    end
  end
end
