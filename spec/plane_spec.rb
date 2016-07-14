require 'plane'
describe Plane do
  it 'reports departed' do
    subject.report_departed
    expect(subject).to be_departed
  end
  it 'landed by default' do
    expect(subject).not_to be_departed
  end
end
