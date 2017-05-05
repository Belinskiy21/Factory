class Factory
  def self.new(*args, &block)
    Class.new do
      attr_accessor  *args


      define_method(:initialize) do |*vars|
        vars.each_with_index { |v, i| send("#{args[i]}=", v) }
      end

      def [](value)
        if value.is_a?(String) || value.is_a?(Symbol)
          instance_variable_get("@#{value}")
        elsif value.is_a?(Integer)
          instance_variable_get("@#{arguments[value]}")
        end
      end

      define_method(:arguments) do
        args
      end

      define_method(:greeting) do
        "Hello #{name}!"
      end

    end
  end
end