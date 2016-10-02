require 'airport'

describe Airport do
  subject(:airport) {described_class.new}

  let(:stormy_weather) {double :stormy_weather, :stormy? => true }
  subject(:stormy_airport) {described_class.new(weather: stormy_weather)}

  let(:sunny_weather) { double :sunny_weather, :stormy? => false }
  subject(:sunny_airport) {described_class.new(weather: sunny_weather)}

  let(:plane) {Plane.new}

  describe "#initialize" do
    context "user sets airport capacity" do
      it "should allow user to set a capacity" do
        airport.instance_variable_get("@capacity")
      end
    end

    context "use defalt capacity" do
      it "should use default capacity of 20 if no capacity is given" do
        expect(airport.capacity).to eq Airport::DEFUALT_CAPACITY
      end
    end
  end

  describe '#land' do

    context 'land the planes on a clear day' do

      it 'tells a plane to land' do
        allow(plane).to receive(:land)
        sunny_airport.land(plane)
      end

      it "has a plane after it has landed" do
        allow(plane).to receive(:land)
        sunny_airport.land(plane)
        expect(sunny_airport.planes).to include plane
      end

      it 'should confirm that a plane has landed' do
        expect(sunny_airport.land(plane)).to eq 'The plane landed safely'
      end

      it 'should not land if the airport is full' do
        Airport::DEFUALT_CAPACITY.times {sunny_airport.land(plane)}
        expect{sunny_airport.land(plane)}.to raise_error "Plane unable to land, airport full"
      end

      it 'should change the status of the plane from flying to landed' do
        allow(plane).to receive(:land)
        sunny_airport.land(plane)
        expect(plane.airborn?).to eq false
      end
     end

     context 'trying to land in stormy weather' do
       it 'should not let the plane land' do
         allow(plane).to receive(:land)
         expect(stormy_airport.planes).not_to include plane
       end

       it 'rasie error when trying to land in stormy weather' do
         expect{stormy_airport.land(plane)}.to raise_error "Weather is too bad to land"
       end
     end
  end

  describe '#take_off' do

    context 'taking off on a sunny day' do
      before do
        sunny_airport.land(plane)
      end

      it 'lets a plane take off' do
        allow(plane).to receive(:take_off)
        sunny_airport.take_off(plane)
      end

      it 'should allow a plan to take off' do
        allow(plane).to receive(:take_off)
        sunny_airport.take_off(plane)
        expect(sunny_airport.planes).not_to include plane
      end

      it 'should make a plane take off' do
        expect(sunny_airport.take_off(plane)).to eq 'The plane has taken off'
      end

      it 'should change the status of the plane from landed to flying' do
        allow(plane).to receive(:take_off)
        sunny_airport.take_off(plane)
        expect(plane.airborn?).to eq true
      end
    end

    context 'taking off on a stormy day' do

      it 'should raise an error when trying to take off' do
        sunny_airport.land(plane)
        expect{stormy_airport.take_off(plane)}.to raise_error 'Can\'t take off due to stormy conditions'
      end
    end

    it 'should only allow plans that are at the airport to take off' do
      allow(plane).to receive(:take_off)
      expect{airport.take_off(plane)}.to raise_error 'This plane is not in the airport'
    end
  end

end
