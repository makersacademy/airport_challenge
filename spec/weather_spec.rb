describe Weather do
  subject (:weather) {Weather.new}

  it 'weather will respond to stormy?'do
  expect(weather).to respond_to(:stormy?)
  end


end
