class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    def index
    end
    
    def about
    end
    
    def _header
        before_action :authenticate_user!
    end
end