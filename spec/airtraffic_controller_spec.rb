require 'airtraffic_controller'

describe Airport do
  
  it 'Should create a new airport' do
    expect(luton = Airport.new).to eq(luton)
  end

  it { is_expected.to respond_to(:land) }
  it { is_expected.to respond_to(:check) }
  it { is_expected.to respond_to(:take_off) }
  it { is_expected.to respond_to(:prevent) }
  # it { is_expected.to respond_to(:weather_condition).with(1).argument }

  describe '#hanger' do
    context 'Weather is clear(prevent == false' do

      it "Should contain empty array hanger." do
        expect(subject.hanger).to eq([])
      end

      it 'Should remove plane from hanger' do
        luton = Airport.new
        allow(luton.prevent).to receive('false')

        slingsby_firefly = Plane.new
        expect(subject.take_off(slingsby_firefly)).to eq []
      end

      it 'Should land plane in hanger' do
        slingsby_firefly = Plane.new
        expect(subject.land(slingsby_firefly)).to eq [slingsby_firefly]
      end

    end
  end

  describe '#check' do
    
    it 'Should check plane isnt in the hanger' do
      luton = Airport.new
      allow(luton.prevent).to receive('false')

      slingsby_firefly = Plane.new
      expect(luton.check(slingsby_firefly)).to eq false
    end

    it 'Should check plane is in the hanger' do
      heathrow = Airport.new
        allow(heathrow.prevent).to receive('false')

      slingsby_firefly = Plane.new
      heathrow.land(slingsby_firefly)
      expect(heathrow.check(slingsby_firefly)).to eq true
    end

  end

  describe '#land' do

    it 'Raises an error when airport is at capacity and plane attempts to land' do
      slingsby_firefly = Plane.new
      expect { 3.times { subject.land(slingsby_firefly) } }.to raise_error("Airport at capacity!")
    end

  end

  describe '#prevent' do
  
    it 'Raises an error and prevents take_off during storm' do
    luton = Airport.new
    srand(1)
    rand(2)
    allow(luton.prevent).to receive('true')
    slingsby_firefly = Plane.new
    expect { luton.take_off(slingsby_firefly) }.to raise_error("Stormy weather all flights grounded!")
    end

    it 'Raises an error and prevents landing during storm' do
    luton = Airport.new
    slingsby_firefly = Plane.new
    expect { luton.land(slingsby_firefly) }.to raise_error("Stormy weather all flights diverted!")
    end
  end

end

