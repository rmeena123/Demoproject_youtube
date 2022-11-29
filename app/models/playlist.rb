class Playlist < ApplicationRecord
	 belongs_to :user
	 belongs_to :post

	 after_create :playlist

	 def playlist
	 	    UserMailer.with(playlist: self).playlist_email.deliver_later
	 end
end
