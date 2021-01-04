# frozen_string_literal: true

module MicroManager
  class Schedule
    private attr_reader :tasks

    def initialize(tasks: [])
      @tasks = tasks
    end

    def add_task(description:, due:)
      tasks << Task.new(description: description, due: due)
    end

    def outstanding_tasks
      tasks
        .select { |task| !task.completed? && task.due <= Date.today }
        .sort_by(&:due)
    end
    
    def tasks_completed(on:)
      tasks.select { |task| task.completed? && task.completed_on == on }
    end
  end
end
