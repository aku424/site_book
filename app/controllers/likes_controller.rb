class LikesController < ApplicationController
	def index
		@user = current_user
		@users = User.all
		@likes = Like.where(user_id:@users.ids)
		# @sites = Site.find(Like.group(:site_id).order("count(site_id) desc"))
	end
	def create
		site = Site.find(params[:site_id])
		like = current_user.likes.new(site_id: site.id)
		like.save
		redirect_back(fallback_location: root_path)
	end
	def destroy
		site = Site.find(params[:site_id])
		# likeのsite_idがsiteのidのlikeをカレントユーザーでの中で探して変数にはめ込んでいる
		like = current_user.likes.find_by(site_id: site.id)
		like.destroy
		redirect_back(fallback_location: root_path)
	end
end
