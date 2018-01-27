require 'airport'

describe Airport do
  let(:plane){double('plane')}



  it 'stores airplanes' do
    subject.planes = [plane,plane,plane]
    expect(subject.planes).to contain_exactly(plane,plane,plane)
  end

  it {is_expected.to respond_to(:weather_report)}

  it 'has a weather attribute' do
    expect(subject.weather).to be_a String
  end

  describe '#weather_report' do
    it 'prints the weather report to the stdout' do
      expect{subject.weather_report}.to output.to_stdout
    end
  end

end
