# frozen_string_literal: true

module MicroManager
  module CLI
    class CommandBuilder
      private attr_reader :context

      def initialize(context:)
        @context = context
      end

      def build(options)
        # antipattern rising, seems to want to delegate to context
        case context
        when :today
          build_for_today(options)
        end
      end

      private

      def build_for_today(options)
        if options.empty?
          ListTasks.new
        else
          AddTodayTask.new(description: options.join(" "))
        end
      end
    end
  end
end
