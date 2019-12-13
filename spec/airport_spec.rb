describe Airport do
  it 'can cereate an instance of an airport' do
    ap = Airport.new
    expect(ap).to be_a Airport
  end
end
