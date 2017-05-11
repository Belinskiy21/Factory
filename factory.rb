class Factory
  def self.new(*args, &block)

     args.first.class == String and args.first[0] == args.first[0].capitalize ? name = args.shift : args.shift

    new_class = Class.new do
      
      attr_accessor  *args


      define_method :initialize do |*attr|
        args.each_with_index do |value, index|
          self.instance_variable_set("@#{value}", attr[index])
        end
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
      
      class_eval &block if block_given?
      

    end
     name ? const_set(name, new_class) : new_class
  end
end