require 'airport'

describe Airport do

  airplane = Airplane.new

  #TDD Step 1
  it 'instructs plane to land at airport' do
    allow(airplane).to receive(:land)
    expect(subject.land(airplane)).to include(airplane)
  end

  #TDD step 2
  it 'instructs plane to take off and confirms not at airport' do
    allow(airplane).to receive(:land).and_return(true)
    subject.take_off(airplane)
    expect(subject.airplanes).not_to include(airplane)
  end

  #TDD step 3 + 4 (But this is on ruby file)
  describe 'land' do
    it 'raises an error when full' do
      subject.capacity.times { subject.land Airplane.new }
      expect { subject.land Airplane.new }.to raise_error 'Airport is full'
    end
  end
end
