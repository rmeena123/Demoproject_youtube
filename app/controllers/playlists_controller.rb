class PlaylistsController < ApplicationController
	def create	
	  @post = Post.find_by(id: params["post_id"])
	  @post.playlists.find_or_create_by(user_id: current_user.id)  

   	respond_to do |format|
        format.html
        format.js {render 'create'}
    end
  end

 	def destroy
 		@playlist = Playlist.find_by(id: params[:id])
 		@playlist.destroy
    @playlist_name = @playlist.post.name
    UserMailer.with(name: @playlist_name,current_user: current_user).playlist_destroy_email.deliver_now       
    redirect_to playlists_path
 	end

 	def index
   @playlists = Playlist.all
 	end

end
