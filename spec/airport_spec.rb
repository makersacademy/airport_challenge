require 'airport'

describe Airport do

  def ensure_sunny_weather
    sunny_rand = Airport::STORM_CHANCE / 2 + 0.5
    allow(Kernel).to receive(:rand).and_return(sunny_rand)
  end

  def ensure_stormy_weather
    stormy_rand = Airport::STORM_CHANCE / 2
    allow(Kernel).to receive(:rand).and_return(stormy_rand)
  end

  context 'in any weather' do

    it { is_expected.to respond_to(:request_take_off).with(1).argument }
    it { is_expected.to respond_to(:request_landing).with(1).argument }
    it { is_expected.to respond_to(:permission_to_take_off?) }
    it { is_expected.to respond_to(:permission_to_land?) }
    it { is_expected.to respond_to(:weather_report) }
    it { is_expected.to respond_to(:full?) }

    it 'returns sunny or stormy when asked for weather report' do
      report = subject.weather_report
      expect(report == :sunny || report == :stormy).to be_truthy
    end

  end

  context 'when full' do

    before :each do
      plane = double :plane, land_at: nil
      subject.request_landing(plane) until subject.full?
    end

    it 'cannot instruct a plane to land' do
      plane = double :plane
      allow(plane).to receive(:land_at).and_raise 'Airport is full'
      expect { subject.request_landing(plane) }.to raise_error 'Airport is full'
    end

    it 'denies permission to planes that want to land' do
      plane = double :plane
      expect(subject.permission_to_land?).not_to be_truthy
    end

    it 'can request a take-off to free up space' do
      plane = double :plane, take_off_from: nil
      subject.request_take_off(plane)
      expect(subject).not_to be_full
    end

  end

  context 'in sunny weather' do

    before :each do
      ensure_sunny_weather
    end

    it 'reports sunny weather' do
      expect(subject.weather_report).to eq :sunny
    end

    it 'releases a plane that it instructs to take off' do
      plane = double :plane, take_off_from: nil, landed_at?: false
      subject.request_take_off(plane)
      expect(subject).not_to have_plane(plane)
    end

    it 'receives a plane that it instructs to land' do
      plane = double :plane, land_at: nil, landed_at?: true
      subject.request_landing(plane)
      expect(subject).to have_plane(plane)
    end

  end

  context 'in stormy weather' do

    before :each do
      ensure_stormy_weather
    end

    it 'reports stormy weather' do
      expect(subject.weather_report).to eq :stormy
    end

  end

  #   context 'when weather conditions are stormy' do
  #     xit 'does not allow a plane to take off'
  #
  #     xit 'does not allow a plane to land'
  #   end
  #   end

end
