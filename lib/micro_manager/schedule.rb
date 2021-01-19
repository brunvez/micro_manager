# frozen_string_literal: true

module MicroManager
  class Schedule
    def initialize(tasks: [])
      @tasks = tasks
    end

    def add_task(description:, due:)
      tasks << Task.new(description: description, due: due)
    end

    def outstanding_tasks
      tasks
        .reject(&:completed?)
        .sort_by(&:due)
    end

    def tasks_completed(on:)
      tasks.select { |task| task.completed? && task.completed_on == on }
    end

    private

    attr_reader :tasks
  end
end
