# frozen_string_literal: true

module MicroManager
  module CLI
    class ListTasks
      def run(schedule:)
        tasks = schedule.outstanding_tasks + schedule.tasks_completed(on: Date.today)
        rows = tasks.map { |task| task_row(task) }
        table = TTY::Table.new(header: ["", "Description", "Due"], rows: rows)
        renderer = TTY::Table::Renderer::Unicode.new(table, padding: [0, 1])

        Result.new { renderer.render }
      end

      private

      def task_row(task)
        [
          task.completed? ? "[X]" : "[ ]",
          task.description,
          task.due.to_s
        ]
      end
    end
  end
end
