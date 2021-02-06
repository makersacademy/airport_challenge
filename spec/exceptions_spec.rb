shared_examples 'custom exceptions' do
  it 'raises custom error with expected message' do
    expect { raise subject }.to raise_error subject, subject.msg
  end
end

describe CapacityError do
  include_examples 'custom exceptions'
end

describe AirportError do
  include_examples 'custom exceptions'
end

describe WeatherError do
  include_examples 'custom exceptions'
end
