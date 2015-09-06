require 'airport'

describe Airport do

  describe 'basic interactions with planes:' do

    # A plane currently in the airport can be requested to take off.

    it { is_expected.to respond_to(:request_take_off).with(1).argument }

    it 'releases a plane that it instructs to take off' do
      plane = double :plane, take_off_from: nil, landed_at?: false
      subject.request_take_off(plane)
      expect(subject).not_to have_plane(plane)
    end

    # A plane currently flying can be requested to land.

    it { is_expected.to respond_to(:request_landing).with(1).argument }

    it 'receives a plane that it instructs to land' do
      plane = double :plane, land_at: nil, landed_at?: true
      subject.request_landing(plane)
      expect(subject).to have_plane(plane)
    end

  end

  describe 'weather reporting:' do

    it { is_expected.to respond_to(:weather_report) }

    it 'returns sunny or stormy when asked for weather report' do
      report = subject.weather_report
      sunny_or_stormy = report == :sunny || report == :stormy
      expect(sunny_or_stormy).to be_truthy
    end

    it 'is normally sunny' do
      sunny_rand = subject.class::STORM_CHANCE / 2 + 0.5
      allow(Kernel).to receive(:rand).and_return(sunny_rand)
      expect(subject.weather_report).to eq :sunny
    end

    it 'is occasionally stormy' do
      stormy_rand = subject.class::STORM_CHANCE / 2
      allow(Kernel).to receive(:rand).and_return(stormy_rand)
      expect(subject.weather_report).to eq :stormy
    end

  end

  describe 'permissions to take off or land:' do

    it { is_expected.to respond_to(:permission_to_take_off?) }
    it { is_expected.to respond_to(:permission_to_land?) }

  end

  describe 'traffic control:' do

    it { is_expected.to respond_to(:full?) }

    context 'when airport is full' do

      before(:example) do
        plane = double :plane, land_at: nil
        subject.request_landing(plane) until subject.full?
      end

      # If the airport is full then no planes can land

      it 'cannot instruct a plane to land' do
        # plane = double :plane, land_at: nil
        plane = Plane.new
        expect {subject.request_landing(plane)}.to raise_error 'Airport is full'
      end

      it 'denies permission to planes that want to land' do
        plane = double :plane
        expect(subject.permission_to_land?).not_to be_truthy
      end

      # Airport is no longer full if a plane is instructed to take off

      it 'can request a take-off to free up space' do
        plane = double :plane, take_off_from: nil
        subject.request_take_off(plane)
        expect(subject).not_to be_full
      end

    end

  end

  #   # Try and take off a plane, but if the weather is stormy,
  #   # the plane can not take off and must remain in the airport.
  #   #
  #   # This will require stubbing to stop the random return of the weather.
  #   # If the airport has a weather condition of stormy,
  #   # the plane can not land, and must not be in the airport
  #
  #   context 'when weather conditions are stormy' do
  #     xit 'does not allow a plane to take off'
  #
  #     xit 'does not allow a plane to land'
  #   end
  #   end

end
