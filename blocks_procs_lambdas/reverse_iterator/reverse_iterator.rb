class Array
  def reverse_iterate
    current_index = self.size-1
    while current_index >= 0
      yield self[current_index]
      current_index -= 1
    end
    self
  end
end