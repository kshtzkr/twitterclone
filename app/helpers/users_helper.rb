module UsersHelper
	def avatar_for(user, options = {size: 80 })
		size = options[:size]
		if user.avatar?
			image_tag user.avatar.url(:thumb), width: size, class: 'avatar_image', style: "border-radius: 50%"
		else
			image_tag 'download.jpg', width: size,class: 'avatar_image', style: "border-radius: 50%"
		end
	end
end