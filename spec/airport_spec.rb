require 'airport'

describe Airport do
  subject(:airport) {described_class.new}
  let(:plane) {double :plane}

  describe "#initialize" do
    context "user sets airport capacity" do
      it "should allow user to set a capacity" do
        airport.instance_variable_get("@capacity")
      end
    end

    context "use defalt capacity" do
      it "should use default capacity of 20 if no capacity is given" do
        expect(airport.capacity).to eq 20
      end
    end
  end

  describe '#land' do

    context 'land the planes on a clear day' do

      before do
        weather = double :weather
        allow(weather).to receive(:stormy?).and_return(false)
      end

      it 'tells the plane to land' do
        allow(plane).to receive(:land)
        airport.land(plane)
      end

      it "has the plane after it has landed" do
        allow(plane).to receive(:land)
        airport.land(plane)
        expect(airport.planes).to include plane
      end

      it 'should confirm that the plane has landed' do
        expect(airport.land(plane)).to eq 'The plane landed safely'
      end

      it 'should not land if the airport is full' do
        Airport::DEFUALT_CAPACITY.times {airport.land(plane)}
        expect{airport.land(plane)}.to raise_error "Plane unable to land, airport full"
       end
     end

     context 'trying to land in stormy weather' do
       before do
         weather = double :weather
         allow(weather).to receive(:stormy?).and_return(true)
       end

       it 'rasie error when trying to land in stormy weather' do
         expect{airport.land(plane)}.to raise_error "Weather is too bad to land"
       end
     end
  end

  describe '#take_off' do

    # before do
    #   weather = Weather.new
    #   allow(weather).to receive(:stormy?).and_return false
    #   airport.land(plane)
    # end

    it 'lets a plane take off' do
      allow(plane).to receive(:take_off)
      airport.take_off
    end

    it 'should allow a plan to take off' do
      allow(plane).to receive(:take_off)
      airport.take_off
      expect(airport.planes).not_to include plane
    end
    it 'should make a plane take off' do
      expect(airport.take_off).to eq 'The plane has taken off'
    end
  end

end
