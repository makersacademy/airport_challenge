require 'airport'

describe Airport do

  it 'lands a plane' do
    plane = 'plane'
    expect(subject.land(plane)).to eq [plane]
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
    condition = "stormy"
    subject.land(ba)
    subject.weather_conditions(condition)
    expect{subject.take_off(ba)}.to raise_error("Stormy weather! Not safe to fly.")
  end

end
