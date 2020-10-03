class Planes
  attr_reader :status

  def take_off
    if @status == 'in air'
      error_status('take off')
    else
      @status = 'in air'
      confirm_status('take off')
    end
  end

  def land
    if @status == 'landed'
      error_status('land')
    else
      @status = 'landed'
      confirm_status('land')
    end
  end

  def confirm_status(action)
    if action == 'land'
      puts "#{self} has landed"
    elsif action == 'take off'
      puts "#{self} has taken off"
    end
  end

  def error_status(action)
    if action == 'land'
      puts "Error: #{self} has already landed..."
    elsif action == 'take off'
      puts "Error: #{self} is already in the air..."
    end
  end
end
