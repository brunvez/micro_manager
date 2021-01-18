# frozen_string_literal: true

module MicroManager
  module CLI
    class AddTask
      def initialize(description:, due: Date.today)
        @description = description
        @due = due
      end

      def run(schedule:)
        schedule.add_task(description: description, due: due)

        Result.new { "Task added successfully" }
      end

      private

      attr_reader :description, :due
    end
  end
end
