class AdminpanelController < ApplicationController
    before_action :authenticate_administrator!

    def admin_panel
    end

    def create_admin
    end

    def new_admin
    end

end
