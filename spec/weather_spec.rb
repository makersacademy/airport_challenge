require 'weather'

describe Weather do
  it {is_expected.to respond_to(:stormy?)}
  it {is_expected.not_to respond_to(:weather)}

  it 'should return true when stormy is called'do
    allow(subject).to receive(:true) {true}
end
it 'should return false when stormy is called'do
  allow(subject).to receive(:false) {false}
end

end
