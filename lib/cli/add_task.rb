# frozen_string_literal: true

module MicroManager
  module CLI
    class AddTask
      private attr_reader :description, :due

      def initialize(description:, due: Date.today)
        @description = description
        @due = due
      end

      def run(schedule:)
        schedule.add_task(description: description, due: due)

        "Task added successfully"
      end
    end
  end
end
