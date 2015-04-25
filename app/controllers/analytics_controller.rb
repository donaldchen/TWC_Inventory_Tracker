class AnalyticsController < ApplicationController
    include Databasedotcom::Rails::Controller
    before_filter :check_admin
    
    def check_admin
        if not session[:admin]
            flash[:notice] = "Only admins can access Analytics"
  		    redirect_to root_path 
  		end
    end

    def index
    end
    
    def overview
        if (params[:order])
            @items = Item__c.all
            if (params[:order] == "name")
                @items.sort! { |a,b| a.Name <=> b.Name }
            elsif (params[:order] == "quantity")
                @items.sort! { |a,b| a.Quantity__c.to_i <=> b.Quantity__c.to_i}
            elsif (params[:order] == "price") 
                @items.sort! { |a,b| a.Price__c.to_i <=> b.Price__c.to_i}
            end
        else
            @items = Item__c.all
        end
    end
    
    def history
    end
    
    def trajectory
    end

end
