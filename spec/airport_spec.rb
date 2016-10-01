require 'airport'

describe Airport do
  subject(:airport) {described_class.new}
  let(:plane) {double :plane}

  # before do
  #   @planes = []
  # end

  describe '#land' do

    it {is_expected.to respond_to(:land).with(1).argument}

    it "allows the plane to land" do
      allow(plane).to receive(:land)
      airport.land(plane)
      expect(airport.planes).to include plane
    end

    it 'should confirm that the plane has landed' do
      expect(airport.land(plane)).to eq 'The plane landed safely'
    end

    it 'should not land if the airport is full' do
      5.times {airport.land(plane)}
      expect{airport.land(plane)}.to raise_error "Plane unable to land, airport full"
     end
  end

  describe '#take_off' do

    before do
      airport.land(plane)
    end

    it {is_expected.to respond_to(:take_off)}

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
