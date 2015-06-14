shared_examples_for Weather do
  
  it 'can be stormy' do
    allow(subject).to receive(:report) { :stormy }
    expect(subject.report).to be :stormy
  end

  it 'can be sunny' do
    allow(subject).to receive(:report) { :sunny }
    expect(subject.report).to be :sunny
  end
end