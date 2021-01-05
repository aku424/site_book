class SitesController < ApplicationController
    before_action :authenticate_user
    before_action :ensure_correct_user
    def index
        @user = current_user
        @site = Site.new
        @sites = @user.sites.all
    end
    def show
        @user = current_user
        @site = Site.find(params[:id])
    end
    def create
        @site = Site.new(site_params)
        # 以下の行がないとcreateできない。userとsiteのマッチが証明できないから。
        @site.user_id = current_user.id
        if @site.save
            redirect_to root_path,notice: "Successful posting!!"
        else
            @user = current_user
            @sites = @user.sites.all
            render :index
        end
    end
    def update
        @site = Site.find(params[:id])
        @site.user_id = current_user.id
        if @site.update(site_params)
            redirect_to root_path,notice: "Successful editing!!"
        else
            @user = current_user
            render :edit
        end
    end
    def edit
         @user = current_user
         @site = Site.find(params[:id])
    end
    def destroy
        @site = Site.find(params[:id])
        @site.destroy
        redirect_to root_path,notice: "Successful deleting!!"
    end
    def ensure_correct_user
      @user = current_user
      if @user.id != current_user.id
         redirect_to root_path
      end
    end
    private
    def site_params
        params.require(:site).permit(:site_name, :discription, :site_url, :user_id)
    end
end
