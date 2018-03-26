require 'airport'

describe Airport do

  describe '#stormy?' do

    it { is_expected.to respond_to(:stormy?) }

    it 'is expected to have a value of true or false' do
      expect(subject.stormy?).to be(true).or be(false)

      # expect(variable).to be_in([true, false])
    end

    it 'should sometimes be true, sometimes false' do
      tf = []
      71.times { tf << subject.stormy? }
      expect(tf).to include(true, false)
    end

  end

  describe '#initialize' do

    it 'should be initialized with an Array called hangar' do
      expect(subject.hangar).to be_an_instance_of(Array)
    end

  end

end

describe Airplane do

  it { is_expected.to respond_to(:land).with(1).arguments }
  it { is_expected.to respond_to(:take_off).with(1).argument }

  describe '#land' do
    # this needs  a mock, it only raises the error when actually stormy
    it 'raises an error if the weather is stormy' do
      hairport = double(:hairport, stormy?: true)
      expect { subject.land(hairport) }.to raise_error "Too stormy!"
    end

    it "puts itself in Airport's hangar" do
      stanstead = Airport.new
      jet2 = Airplane.new
      jet2.land(stanstead)
      expect(stanstead.hangar.last).to eq jet2
    end

    it 'Airport should exist' do
      # expect((subject.land("any")) with(instance_of(Airport)))
      # expect { subject(:land).with(instance_of(Airport)) }
      # expect land(with(instance_of(Airport)))
      # expect(land).instance_of(Airport)
    end

  end

  describe '#take_off' do
    # I cant get this damn mock to work!
    it 'raises an error if the plane is not there' do
      nairport = double(:nairport, hangar: [])
      # allow(:airport).to receive(:hangar).and_return(false)
      expect { subject.take_off(nairport) }.to raise_error 'Im not at your airport, fools!'
    end

    it "removes the plane from from the hangar" do
      heathrow = Airport.new
      jumbo = Airplane.new
      jumbo.land(heathrow)
      jumbo.take_off(heathrow)
      expect(heathrow.hangar).not_to include(jumbo)
    end

  end

end
