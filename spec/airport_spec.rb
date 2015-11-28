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
      weather_condition = 1
      expect { subject.instruct_take_off }.to raise_error "There are no planes in the airport"
    end

    it 'should raise an error if the weather is stormy' do
      plane = double(:plane, in_airport_status: false, land: true, take_off: false)
      subject.instruct_to_land(plane)
      weather_condition = 5
      expect { subject.instruct_take_off }.to raise_error "No planes can take off as it is stormy"
    end

    it "should change the plane's status to not in airport" do
      plane = double(:plane, in_airport_status: false)
      expect(plane.in_airport_status).to eq false
    end
  end

  describe '#weather' do
    it 'should set a weather condition' do
      subject.weather
      expect(subject.weather_condition).not_to be_nil
    end

  end
end
