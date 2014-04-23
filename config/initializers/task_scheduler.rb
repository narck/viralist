scheduler = Rufus::Scheduler.new

scheduler.every '3d' do
   	subscribers = User.where(:subscribed => true)
   	for user in subscribers 
   		#InfoMailer.inform_threshold(user).deliver
   	end
   	
end 