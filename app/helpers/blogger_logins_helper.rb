module BloggerLoginsHelper
	def gravatar_for(user, options={size: 80})
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    # gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    size=options[:size]
    gravatar_url="kitten.jpg"
    image_tag(gravatar_url, alt: user.name, class: "gravatar",height: 80, width: 100)
  end
end
