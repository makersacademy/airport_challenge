require 'airport'

describe Airport do


  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:take_off).with(1).argument }
  it { is_expected.to respond_to(:hanger)}

  let(:plane) {double(:plane)}
  let(:subject) {Airport.new}
  let(:Weather) {double(:Weather)}

  let(:planes_arr) do
    [red_plane = double(:plane),
    green_plane = double(:plane),
    blue_plane = double(:plane)]
  end


  describe '#initialize' do
    it 'has a variable capacity' do
      good_weather
      plane_is_flying
      subject = Airport.new(1)
      subject.land plane
      expect{ subject.land planes_arr.last }.to raise_error 'Airport Full'
    end

  end

  describe '#land' do
    it 'planes enter the airport when they land' do
      good_weather
      plane_is_flying
      subject.land plane
      expect(subject.hanger).to eq [plane]
    end
    it 'planes cannot land if airport is full' do
      good_weather
      plane_is_flying
      subject = Airport.new(3)
      planes_arr.each do |x|
        allow(x).to receive(:airborne).and_return(true)
        allow(x).to receive(:down)
        subject.land(x)
      end
      expect{subject.land plane}.to raise_error 'Airport Full'
    end
    it 'planes cannot land when weather is bad' do
      bad_weather
      plane_is_flying
      expect { subject.land plane }.to raise_error 'It is too dangerous to do that right now.'

    end
    it 'planes cannot land if they are not airborne' do
      good_weather
      plane_is_grounded
      expect {subject.land plane}.to raise_error 'That plane is not airborne, so cannot land'

    end
    it 'planes cannot land if they are already in the airport' do
      good_weather
      plane_is_flying
      subject.land plane
      expect {subject.land plane}.to raise_error 'this plane is already at this airport!'
    end
    it 'planes cannot land if they are in another airport' do
      good_weather
      plane_is_flying
      gatwick = Airport.new
      heathrow = Airport.new
      gatwick.land(plane)
      plane_is_grounded
      expect{heathrow.land plane}.to raise_error 'That plane is not airborne, so cannot land'
    end
  end

  describe '#take_off' do
    it 'planes leave the airport after takeoff' do
      good_weather
      plane_is_flying
      subject.land(plane)
      plane_is_grounded
      subject.take_off plane
      expect(subject.hanger).to eq []
    end
    it 'planes cannot take off when weather is bad' do
      good_weather
      plane_is_flying
      subject.land(plane)
      plane_is_grounded
      bad_weather
      expect { subject.take_off plane }.to raise_error 'It is too dangerous to do that right now.'

    end
    it 'planes can only take off from the airport they landed at' do
      good_weather
      gatwick = Airport.new
      heathrow = Airport.new
      plane_is_flying
      gatwick.land plane
      plane_is_grounded
      expect{heathrow.take_off plane}.to raise_error 'this plane is not at this airport!'
    end
  end

  private

  def good_weather
    allow(Weather).to receive(:fair?).and_return(true)
  end

  def bad_weather
    allow(Weather).to receive(:fair?).and_return(false)
  end

  def plane_is_flying
    allow(plane).to receive(:airborne).and_return(true)
    allow(plane).to receive(:down)
  end

  def plane_is_grounded
    allow(plane).to receive(:airborne).and_return(false)
    allow(plane).to receive(:up)
  end
end
