require 'weather'

shared_examples_for Weather do
  it 'returns stormy when chance returns 6' do
    subject.stub(:chance) {6}
    expect(subject.weather?).to eq :stormy
  end
end
