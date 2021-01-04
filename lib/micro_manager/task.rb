# frozen_string_literal: true

module MicroManager
  class Task
    attr_reader :description, :due, :completed, :completed_on

    def initialize(description:, due:)
      @description = description
      @due = due
      @completed = false
    end

    def complete
      @completed = true 
      @completed_on = Date.today
    end

    def ==(other)
      description == other.description && completed == other.completed
    end
  end
end

