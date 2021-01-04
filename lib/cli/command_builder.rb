# frozen_string_literal: true

require "optparse"

module MicroManager
  module CLI
    class CommandBuilder
      def build(input)
        params = parse_input(input)
        build_for_today(params)
      end

      private

      def parse_input(input)
        params = {}
        rest = parser.parse(input, into: params)

        params.merge(rest: rest)
      end

      def build_for_today(params)
        if params[:help]
          ShowHelp.new(parser)
        elsif params[:"list-tasks"] || params[:rest].empty?
          ListTasks.new
        else
          task = { description: params[:rest].join(" ") }
          task.merge!(due: params[:due]) if params[:due]
          AddTask.new(**task)
        end
      end

      def parser
        OptionParser.new do |opts|
          opts.accept(RelativeDate) do |date|
            RelativeDate.parse(date)
          end
          opts.on("-d", "--due [DATE]", RelativeDate, "Date to which the task is due, defaults to Date.today. Supports relative dates (e.g. 1-day, 2-weeks, etc)")
          opts.on("-l", "--list-tasks", "Lists all due tasks and tasks completed today")
          opts.on("-h", "--help", "Prints this help")
        end
      end
    end
  end
end
