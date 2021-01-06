# frozen_string_literal: true

require "tty-prompt"

module MicroManager
  module CLI
    class CompleteTask
      private attr_reader :prompt

      def initialize(prompt: TTY::Prompt.new)
        @prompt = prompt
      end

      def run(schedule:)
        tasks = schedule.outstanding_tasks
        options = tasks.map { |task| { task.description => task } }
        options << { "Exit" => nil }

        Result.new do
          task = prompt.select("Complete task", options)
          task&.complete

          nil
        end
      end
    end
  end
end
