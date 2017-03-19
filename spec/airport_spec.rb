require 'airport'

describe Airport do

  subject{Airport.new(2)}

  describe "#land" do

    it 'lands a plane' do
      plane = 'plane'
      expect(subject.land(plane)).to eq [plane]
    end

    it 'stops a plane from landing if stormy' do
      plane = 'ba'
      condition = Weather.new
      allow_any_instance_of(Weather).to receive(:forecast).and_return("stormy")
      subject.weather_conditions(condition)
      expect{subject.land(plane)}.to raise_error("Too stormy to land!")
    end

    it 'stops a plane from landing if airport full' do
      plane = "BA"
      subject.capacity.times{subject.land(plane)}
      expect{subject.land(plane)}.to raise_error("Can't land airport full.")
    end

  end

  describe '#landed?' do
    it 'checks if a specific plane has landed' do
      plane = 'plane'
      subject.land(plane)
      expect(subject.landed?(plane)).to eq true
    end

    it 'expects the plane to have taken off' do
      ba = 'BA'
      aerlingus = 'Aer Lingus'
      subject.land(ba)
      subject.land(aerlingus)
      subject.take_off(ba)
      expect(subject.landed?(ba)).to eq false
      expect(subject.landed?(aerlingus)).to eq true
    end
  end

  it 'causes a plane to take off' do
    ba = 'BA'
    aerlingus = 'Aer Lingus'
    subject.land(ba)
    subject.land(aerlingus)
    expect(subject.take_off(ba)).to eq ba
  end

  it "doesn't allow plane to take off if stormy" do
    ba = 'BA'
    condition = Weather.new
    allow_any_instance_of(Weather).to receive(:forecast).and_return("stormy")
    subject.land(ba)
    subject.weather_conditions(condition)
    expect{subject.take_off(ba)}.to raise_error("Stormy weather! Not safe to fly.")
  end

end
