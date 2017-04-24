class Factory
include Enumerable

	def self.new(*args. &block)
		 args.first.class == String &&
		 args.first[0] == args.first[0].capitalize ? name = args.shift : args.shift

    

    new_class = Class.new do

    	args.each { |value| attr_accessor value.to_sym }

    	define_method :initialize do

    	end

    	define_method [] 

    	end



    end

	end

end