# frozen_string_literal: true

module MicroManager
  module CLI
    class AddTodayTask
      private attr_reader :description

      def initialize(description:)
        @description = description
      end

      def run(schedule:)
        schedule.add_task(description: description, due: Date.today)

        "Task added successfully"
      end
    end
  end
end

