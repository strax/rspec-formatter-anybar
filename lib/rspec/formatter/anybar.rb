require 'rspec'
require "rspec/formatter/anybar/version"
require 'socket'

module RSpec
  module Formatter
    class Anybar
      def initialize
        @client = UDPSocket.new
      end

      def start(*)
        notify(:pending)
      end

      def stop(notification)
        notify(success?(notification) ? :success : :failure)
      end

      private

      def success?(notification)
        notification.failed_examples.empty?
      end

      def notify(status)
        @client.send color_for(status), 0, "127.0.0.1", 1738
      end

      def color_for(status)
        case status
        when :pending then 'yellow'
        when :success then 'green'
        when :failure then 'red'
        end
      end
    end
  end
end

RSpec.configure do |config|
  config.reporter.register_listener RSpec::Formatter::Anybar.new, :start, :stop
end
