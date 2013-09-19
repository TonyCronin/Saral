# saral/lib/saral.rb
require "saral/version"
require "saral/routing"
require "saral/controller"

module Saral
	# Our code goes here...
	class Application
	 def call(env)
		begin 
			klass, act = get_controller_and_action(env)
			controller = klass.new(env)
		#routing has returned an unknown cotroller
		rescue NameError #I dont know this controler
			#define a new Controller (Parent object of CourseContoller) 
			controller = Controller.new(env)
		end
		begin
			text = controller.send(act)
		rescue TypeError #the rescue above was causing act to become nil? I've used a stopgap symbol :unknown
			text = controller.send(:unknown)
		end
		[200, {'Content-Type' => 'text/html'}, [text]]
	 end
	end
end