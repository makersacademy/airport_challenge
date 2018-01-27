require 'airport'

describe Airport do
  let(:plane){double('plane')}

  it 'stores airplanes' do
    subject.planes = [plane,plane,plane]
    expect(subject.planes).to contain_exactly(plane,plane,plane)
  end
end
