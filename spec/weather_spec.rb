require 'weather'

# matcher to test booleans 
RSpec::Matchers.define :be_boolean do
  match do |actual|
    expect(actual).to satisfy { |x| x == true || x == false }
  end
end

describe Weather do

  it {is_expected.to respond_to(:good_forecast?)}

  it 'checks #good_forecast? return' do 
    expect(subject.good_forecast?).to be_boolean
  end
  
end