require 'airport'

describe Airport do
  let (:plane) {Plane.new}
  before(:each) do
    subject.stub check_weather: "Sunny"
  end

  describe 'take off' do

    it {is_expected.to respond_to(:instruct_takeoff).with(1).argument}

    it 'instructs a plane to take off' do
      plane.land(subject)
      subject.instruct_takeoff(plane)
      expect(plane).to be_flying
    end

    it "airport has a default capacity" do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it 'removes planes that have left from the plane array' do
      plane.land(subject)
      plane.takeoff(subject)
      expect(subject.planes).to be_empty
    end
  end

  describe 'landing' do

    it "gives permission for planes to land" do
      expect(subject.request_land?(plane)).to eq true
      end

    it "gives permission for planes to takeoff" do
      plane.land(subject)
      expect(subject.request_takeoff?(plane)).to eq true
    end

    it 'instructs a plane to land' do
    subject.instruct_land(plane)
    expect(plane).not_to be_flying

    end

    it 'receives a plane' do
      subject.instruct_land(plane)
      expect(subject.planes[0]).to eq plane

    end

  end

  describe 'traffic control' do

    context 'when airport is full' do

      it 'does not allow a plane to land' do
      subject.capacity.times { subject.planes << :plane }
      expect { plane.land(subject) }.to raise_error "Airport full"

      end

    end

    it "when a plane lands and takes off it should be the same plane" do
      plane.land(subject)
      plane.takeoff(subject)
      expect(plane).to eq plane
    end

  end

    context 'when weather conditions are stormy' do
      it "can check the weather" do
        expect(subject.check_weather.is_a?(String)).to eq true
      end

      it "can return stormy or sunny" do
        subject.stub check_weather: "Stormy"
        expect(subject.check_weather).to eq "Stormy"
        subject.stub check_weather: "Sunny"
        expect(subject.check_weather).to eq "Sunny"
      end

      it 'does not allow a plane to land if weather is stormy' do
        subject.stub check_weather: "Stormy"
        expect { subject.request_land?(plane) }.to raise_error "Weather bad: landing not permitted"
      end
      it 'does not allow a plane to takeoff if weather is stormy' do
        subject.stub check_weather: "Stormy"
        expect { subject.request_takeoff?(plane) }.to raise_error "Weather bad: landing not permitted"
      end
    end

end
