class AdminpanelController < ApplicationController
    before_action :authenticate_administrator!

    def new_admin
        @administrator = Administrator.new
    end

    def create_admin
        #render plain: params[:administrator]

        @administrator = Administrator.new(administrator_params)
        if @administrator.save
            redirect_to '/admin_panel/show_admin'
        else
                render 'new_admin'
        end
    end

    def show_admin
        
    end

    def admin_panel
    end

    private
    def administrator_params
        params.require(:administrator).permit(:email, :password, :password_confirmation)
    end
end
