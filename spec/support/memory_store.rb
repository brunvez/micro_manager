# frozen_string_literal: true

class MemoryStore
  def initialize
    @content = {}
  end

  def write(location, content)
    @content[location] = content
  end

  def read(location)
    @content[location]
  end
end
