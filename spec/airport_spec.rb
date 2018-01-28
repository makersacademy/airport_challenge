require 'airport'

describe Airport do

  describe '#planes' do

    let(:plane) { double('plane') }

    it 'stores airplanes' do
      subject.planes = [plane, plane, plane]
      expect(subject.planes).to contain_exactly(plane, plane, plane)
    end
  end

  describe '#initialize' do
    let(:plane) { double('plane') }
    let(:airport_max10) { Airport.new(10) }
    it 'gives self a variable capacity' do
      10.times { airport_max10.planes << plane }
      expect(airport_max10.full?).to be true
    end

    it 'gives self a maximum default capacity' do
      Airport::DEFAULT_CAPACITY.times { subject.planes << plane }
      expect(subject.full?).to be true
    end

  end

  describe '#weather_report' do
    it 'prints the weather report to the stdout' do
      expect { subject.weather_report } .to output.to_stdout
    end
  end

end
