module Full_Or_Empty
  private

  def full?(storage)
    storage.count >= capacity
  end
end
