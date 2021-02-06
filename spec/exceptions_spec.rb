shared_examples 'custom exceptions' do
  it 'raises custom error with specific message' do
    expect { raise subject }.to raise_error subject, subject.msg
  end
end

context 'Exceptions' do
  describe CapacityError do
    include_examples 'custom exceptions'
  end

  describe AirportError do
    include_examples 'custom exceptions'
  end

  describe WeatherError do
    include_examples 'custom exceptions'
  end

  describe LandingError do
    include_examples 'custom exceptions'
  end

  describe TakeOffError do
    include_examples 'custom exceptions'
  end
end
