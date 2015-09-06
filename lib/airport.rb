class Airport

def release(plane)
end

def receive(plane)
  fail 'airport full' if full?
end

def full?
  true
end

end
