class AdminpanelController < ApplicationController
    before_action :authenticate_administrator!
    before_action :must_be_admin, only: [:new_admin,:create_admin,:index_admin,:destroy]

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

    def index_admin
        @administrators = Administrator.all
    end

    def destroy
        #render plain: params[:email].inspect
        @admin = Administrator.find(params[:id])
        if @admin.destroy && @admin.privileges!=0
            redirect_to admin_panel_index_admin_path(removed:'true')
        else
            redirect_to admin_panel_index_admin_path(removed:'false')
        end
    end

    def admin_panel
    end

    private
    def administrator_params
        params.require(:administrator).permit(:email, :password, :password_confirmation,:id, :privileges)
    end

    def must_be_admin
        unless current_administrator.privileges == 0
          redirect_to root_path
        end
    end

end
