require 'airport'

describe Airport do

  airplane = Airplane.new
  weather = 'normal'

  describe 'land' do

    # TDD Step 1
    it 'instructs plane to land at airport' do
      allow(airplane).to receive(:land)
      expect(subject.land(airplane, weather)).to include(airplane)
    end

    # TDD step 3 + 4 (But this is on ruby file)
    it 'raises an error when full' do
      subject.capacity.times { subject.land Airplane.new }
      expect { subject.land Airplane.new, weather }.to raise_error 'Airport is full'
    end

    # TDD step 6
    it 'prevents landing of plane when weather is stormy' do
      expect { subject.land Airplane.new, 'stormy' }.to raise_error 'Cannot land plane due to stormy weather'
    end
  end

  describe 'takeoff' do

    # TDD step 2
    it 'instructs plane to take off and confirms not at airport' do
      allow(airplane).to receive(:land).and_return(true)
      subject.take_off(airplane, weather)
      expect(subject.airplanes).not_to include(airplane)
    end

    # TDD step 5
    it 'prevents takeoff of plane when weather is stormy' do
      expect { subject.take_off Airplane.new, 'stormy' }.to raise_error 'Cannot takeoff plane due to stormy weather'
    end
  end
end
