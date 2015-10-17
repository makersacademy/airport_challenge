require 'airport'

describe Airport do
  let(:plane) {double :plane}

  it 'allows a plane to land in sunny weather' do
    allow(subject).to receive(:weather?).and_return('sunny')
    subject.plane_land(plane)
    expect(subject.planes.last).to eq (plane)
  end

  it 'raises an error when a plane tries to land in stormy weather' do
  allow(subject).to receive(:weather?).and_return('stormy')
  expect {subject.plane_land(plane)}.to raise_error 'the plane cannot land as the weather is stormy'
  end
end