require './lib/airport.rb'

describe Airport do
subject(:airport) {described_class.new}
let(:plane) {Plane.new}


  describe '#landing' do
    it 'Indicates that a plane has landed' do
      expect(subject.landing(plane)).to eq([plane])
    end

    it "Raises an error to say that the airport is full" do
      Airport::DEFAULT_CAPACITY.times {airport.landing plane}
      expect {airport.landing(plane)}.to raise_error "Can't land. Airport is full"
    end
  end

  context 'departures in bad weather'
     before { allow(airport).to receive(:weather_bad).and_return true }

    it 'Raises an error if a plane tries to take off in stormy weather' do
      expect {subject.take_off(plane)}.to raise_error "No take off: Stormy weather"
    end

  context 'departures in clear weather'
    before { allow(airport).to receive(:weather_bad).and_return false }

  describe '#take_off' do
    it 'Indicates that a plane has taken off' do
      subject.take_off(plane)
      expect(subject.take_off(plane)).to eq []
      #question the above. It is returning the above, as the final line to
      #be executed is removing the plane instance from the @planes array.
      # Not sure if this is the expected response though.
    end

    it 'Indicates that the plane has safely taken off' do
      subject.take_off(plane)
      expect(plane.status).to eq "Safe take off"
    end
  end
end
