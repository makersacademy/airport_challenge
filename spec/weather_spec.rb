describe Weather do

  it {is_expected.to respond_to (:sunny?) }

  it {is_expected.to respond_to (:stormy?) }

  it 'returns true if weather is stormy' do
  allow(subject).to receive(:stormy?) { true }
  expect(subject.stormy?).to eq true
  end

  it 'returns true if weather is sunny' do
  allow(subject).to receive(:sunny?) { true }
  expect(subject.sunny?).to eq true
  end

  it 'returns false if weather is not stormy' do
  allow(subject).to receive(:stormy?) { false }
  expect(subject.stormy?).to eq false
  end

  it 'returns false if weather is not sunny' do
  allow(subject).to receive(:sunny?) { false }
  expect(subject.sunny?).to eq false
  end


end
