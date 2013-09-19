# saral/lib/saral/routing.rb
module Saral
	class Application
		def get_controller_and_action(env)
			_, cont, action, after = env["PATH_INFO"].split('/', 4)
			cont = cont.capitalize
			cont += "Controller"
			puts "#{cont} {action}"
			begin
				[Object.const_get(cont), action]
			rescue
				[Object.const_get("Controller"),action]
			end
	 end
 end
end