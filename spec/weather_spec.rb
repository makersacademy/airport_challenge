require 'weather'
require 'airport'

describe Weather do 
  
  it { is_expected.to respond_to(:generate) } 

  it 'returns sunny when method is called on class' do
  	current = Weather.new
    allow(current).to receive(:generate).and_return("sunny")

    expect(current.generate).to eq("sunny")
  end

  it 'returns stormy when method is passed integer > 7' do
  	expect(subject.generate).to eq("stormy")
  end
 
end
