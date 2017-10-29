require_relative 'feature_test'


describe 'Two way journey' do
  test = Two_Way_Journey.new
  it 'Runs test and returns success' do
    expect(test.start).to eq "Test Successfull\n"
  end
end