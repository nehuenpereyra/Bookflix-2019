class SubscribersController < ApplicationController
    
    before_action :authenticate_subscriber!
    skip_before_action :check_current_profile_exists

    def edit_pass
        @subscriber = current_subscriber
    end

    def update_pass
        @subscriber = Subscriber.find(current_subscriber.id)
        if @subscriber.update_attributes(subscriber_params)
            redirect_to root_path
        else
            render 'edit_pass'
        end
    end

    private
    def subscriber_params
        params.require(:subscriber).permit(:email, :password, :password_confirmation)
    end
end
