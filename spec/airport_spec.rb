require 'airport'

describe Airport do

  describe '#arrival' do
    it { is_expected.to respond_to(:arrival).with(2).argument }

    it 'throw error when airport is full' do
      50.times { subject.arrival(Plane.new, 50) }
      expect { subject.arrival(Plane.new, 50) }.to raise_error "airport is full you can't land"
    end

    it 'add plane to airport' do
      plane = Plane.new
      expect(subject.arrival(plane, 1)).to eq(1)
    end
  end

  describe '#departure' do
    it { is_expected.to respond_to :departure }
    it 'remove plane from airport when plane off' do
      expect(subject.departure).to eq 0
    end
    # it 'raise error when no plane to departure' do
    #   expect { subject.departure }.to raise_error "no plane on airport to departure"
    # end
  end

  describe '#weather_rand' do
    it { is_expected.to respond_to :weather_rand }

    it 'return random numbers for weather_rand' do
      expect(subject.weather_rand).to be_between(0, 100)
    end
  end

end
