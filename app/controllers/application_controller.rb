class ApplicationController < ActionController::Base
    before_action :get_communities

    def get_communities
        @communities = Community.all
    end
end
