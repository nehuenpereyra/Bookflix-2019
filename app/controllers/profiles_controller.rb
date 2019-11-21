class ProfilesController < ApplicationController
        
    before_action :authenticate_subscriber!
    skip_before_action :check_current_profile_exists

    def new
        @profile = Profile.new
    end

    def create
        #render plain: params[:profile].inspect
        @profile = Profile.new(profile_params)
        if @profile.save
            @profile.subscriber.update_attribute("current_profiles",@profile.subscriber.current_profiles+1)
            redirect_to profiles_path
        else
                render 'new'
        end
    end

    def show
        user = Subscriber.find(current_subscriber.id)
        @profile = user.profiles.find_by_id(params[:id])
        if @profile == nil
            redirect_to :controller => 'home', :action => 'index'
        end
    end

    def index
        #@profiles = Profile.all
        user = Subscriber.find(current_subscriber.id)
        @profiles = user.profiles.all
        if params[:id] != nil
            cookies[:current_profile_id] = params[:id]
            redirect_to :controller => 'home', :action => 'index'
        end
    end

    def edit
        #@profile = Profile.find(params[:id])
        user = Subscriber.find(current_subscriber.id)
        @profile = user.profiles.find_by_id(params[:id])
        if @profile == nil
            redirect_to :controller => 'home', :action => 'index'
        end
    end

    def update
        @profile = Profile.find(params[:id])
        if @profile.update(profile_params)
        redirect_to @profile
        else
        render 'edit'
        end
    end

    def destroy
        #@profile = Profile.find(params[:id])
        user = Subscriber.find(current_subscriber.id)
        @profile = user.profiles.find_by_id(params[:id])
        if @profile == nil
            redirect_to :controller => 'home', :action => 'index'
        end

        title = @profile.name
        if @profile.destroy
            @profile.subscriber.update_attribute("current_profiles",@profile.subscriber.current_profiles-1)
            redirect_to profiles_path(removed: title)
        else
            redirect_to profiles_path(error_removed: title)
        end
    end

    private
    def profile_params
        params.require(:profile).permit(:name, :url_image, :age_restriction, :subscriber_id)
    end
end
