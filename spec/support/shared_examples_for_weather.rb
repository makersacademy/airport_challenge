
shared_examples_for Weather do

  it {is_expected.to respond_to :weather_conditions}

  it 'should return a boolean to indicate weather conditions' do
    expect(subject.weather_conditions).to eq(true) | eq(false)
  end

end
