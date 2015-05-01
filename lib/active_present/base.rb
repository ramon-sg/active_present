module ActivePresent
  class Base
    attr_reader :object, :template

    def initialize(object, template)
      @object = object
      @template = template
    end

    private
      def self.presents(name)
        define_method(name) do
          @object
        end
      end

      def method_missing(*args, &block)
        template.send(*args, &block)
      end
  end
end