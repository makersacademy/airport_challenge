require 'airport'

describe Airport do


  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:take_off).with(1).argument }
  it { is_expected.to respond_to(:hanger)}

  let(:plane) {double(:plane)}
  let(:subject) {Airport.new}
  let(:Weather) {double(:Weather)}

  let(:planes_arr) do
    red_plane = double(:plane)
    green_plane = double(:plane)
    blue_plane = double(:plane)
    return [red_plane, blue_plane, green_plane]
  end


  describe '#initialize' do
    it 'has a variable capacity' do
      allow(Weather).to receive(:fair?).and_return(true)
      allow(plane).to receive(:airborne).and_return(true)
      allow(plane).to receive(:down)
      subject = Airport.new(1)
      red_plane = double(:red_plane)
      subject.land plane
      expect{ subject.land red_plane }.to raise_error 'Airport Full'
    end

  end

  describe '#land' do
    it 'planes enter the airport when they land' do
      allow(Weather).to receive(:fair?).and_return(true)
      allow(plane).to receive(:airborne).and_return(true)
      allow(plane).to receive(:down)
      subject.land plane
      expect(subject.hanger).to eq [plane]
    end
    it 'planes cannot land if airport is full' do
      allow(Weather).to receive(:fair?).and_return(true)
      allow(plane).to receive(:airborne).and_return(true)
      allow(plane).to receive(:down)
      subject = Airport.new(3)
      planes_arr.each do |x|
        allow(x).to receive(:airborne).and_return(true)
        allow(x).to receive(:down)
        subject.land(x)
      end
      expect{subject.land plane}.to raise_error 'Airport Full'
    end
    it 'planes cannot land when weather is bad' do
      allow(plane).to receive(:airborne).and_return(true)
      allow(Weather).to receive(:fair?).and_return(false)
      expect { subject.land plane }.to raise_error 'It is too dangerous to do that right now.'

    end
    it 'planes cannot land if they are not airborne' do
      allow(Weather).to receive(:fair?).and_return(true)
      allow(plane).to receive(:airborne).and_return(false)
      expect {subject.land plane}.to raise_error 'That plane is not airborne, so cannot land'

    end
    it 'planes cannot land if they are already in the airport' do
      allow(Weather).to receive(:fair?).and_return(true)
      allow(plane).to receive(:airborne).and_return(true)
      allow(plane).to receive(:down)
      subject.land plane
      expect {subject.land plane}.to raise_error 'this plane is already at this airport!'
    end
    it 'planes cannot land if they are in another airport' do
      allow(Weather).to receive(:fair?).and_return(true)
      allow(plane).to receive(:airborne).and_return(true)
      allow(plane).to receive(:down)
      gatwick = Airport.new
      heathrow = Airport.new
      gatwick.land(plane)
      allow(plane).to receive(:airborne).and_return(false)
      expect{heathrow.land plane}.to raise_error 'That plane is not airborne, so cannot land'
    end
  end

  describe '#take_off' do
    it 'planes leave the airport after takeoff' do
      allow(Weather).to receive(:fair?).and_return(true)
      allow(plane).to receive(:up)
      allow(plane).to receive(:down)
      allow(plane).to receive(:airborne).and_return(true)
      subject.land(plane)
      allow(plane).to receive(:airborne).and_return(false)
      subject.take_off plane
      expect(subject.hanger).to eq []
    end
    it 'planes cannot take off when weather is bad' do
      allow(Weather).to receive(:fair?).and_return(true)
      allow(plane).to receive(:airborne).and_return(true)
      allow(plane).to receive(:down)
      subject.land(plane)
      allow(plane).to receive(:airborne).and_return(false)
      allow(Weather).to receive(:fair?).and_return(false)
      expect { subject.take_off plane }.to raise_error 'It is too dangerous to do that right now.'

    end
    it 'planes can only take off from the airport they landed at' do
      allow(Weather).to receive(:fair?).and_return(true)
      gatwick = Airport.new
      heathrow = Airport.new
      allow(plane).to receive(:airborne).and_return(true)
      allow(plane).to receive(:down)
      allow(plane).to receive(:up)
      gatwick.land plane
      allow(plane).to receive(:airborne).and_return(false)
      expect{heathrow.take_off plane}.to raise_error 'this plane is not at this airport!'
    end
  end
end
