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
            lol = Item__History.all
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
        history = Item__History.all
        history.sort! { |a,b| a.CreatedDate <=> b.CreatedDate }
        history.reverse!
        items = Item__c.all
        itemnames = Hash.new
        items.each do |i|
            itemnames[i.Id] = i.Name
        end
        @dates = []
        prev_date = nil
        date = nil
        history.each do |h|
            if prev_date == nil
                prev_date = h.CreatedDate.beginning_of_day
                date = DateEntry.new(h.CreatedDate.beginning_of_day)
            elsif (prev_date <=> h.CreatedDate.beginning_of_day) != 0
                prev_date = h.CreatedDate.beginning_of_day
                date.calcStart
                @dates << date
                date = DateEntry.new(h.CreatedDate.beginning_of_day)
            end
            name = itemnames[h.ParentId]
            date.update(name, h.OldValue.to_i, h.NewValue.to_i)
            
        end
        if date != nil
            date.calcStart
            @dates << date
        end
    end
    
    class DateEntry
        attr_accessor :d, :items
        @d
        @items
        def initialize(date)
            @items = {}
            @d = date
        end
        
        def update(name, ovalue, nvalue)
            if not @items.has_key? name
                @items[name] = [0, 0, 0, nvalue]
            end
            diff = nvalue - ovalue
            if diff > 0
                @items[name][0] += diff
            else
                @items[name][1] -= diff
            end
        end
        
        def calcStart
            @items.each do |k, v|
                v[2] = v[3] - v[0] + v[1]
            end
        end
        
    end
    
    def trajectory
        @items = Item__c.all
    end

    def itemtrajectory
        @history = Item__History.find_all_by_ParentId(params[:id])
        @Day = 0
        @Month = 0
        @Year = 0
        @time = Time.now
        @history.each do |entry|
            if @time - entry.CreatedDate < 86400
                @Day += entry.NewValue.to_i - entry.OldValue.to_i
                @Month += entry.NewValue.to_i - entry.OldValue.to_i
                @Year += entry.NewValue.to_i - entry.OldValue.to_i
            elsif @time - entry.CreatedDate < 2592000
                @Month += entry.NewValue.to_i - entry.OldValue.to_i
                @Year += entry.NewValue.to_i - entry.OldValue.to_i
            elsif @time - entry.CreatedDate < 31536000
                @Year += entry.NewValue.to_i - entry.OldValue.to_i
            end
        end
    end

end
