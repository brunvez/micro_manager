# frozen_string_literal: true

module MicroManager
  module CLI
    class CommandBuilder
      private attr_reader :context

      def initialize
      end

      def build(options)
        build_for_today(options)
      end

      private

      def build_for_today(options)
        if options.empty?
          ListTasks.new
        else
          AddTask.new(description: options.join(" "))
        end
      end
    end
  end
end
