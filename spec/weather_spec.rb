require 'weather'

shared_examples_for Weather do
  subject(:Weather) {described_class.new}

  it 'should return both true and false' do
    test_array = []
    100.times { test_array << subject.stormy? }
    expect(test_array).to include(true, false)
  end
end
