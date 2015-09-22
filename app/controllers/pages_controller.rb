class PagesController < ApplicationController
  
  def index
  		@pages="Balaji"
  end

 def new
  	

    #@rowvalues=Place.find_by_placename(params[:place])
    #@rowvalues=Place.where("placename = ?", params[:place]).first
    #@query = Place.select(:placename).first




    p=Place.where("placename= ?", params[:place])
    puts p.to_s
    @days = params[:days]
    @nights = params[:nights] 
    @place = params[:place]
    @rowvalues=Place.select("@place, daycharge")

    Place.select("placename, daycharge,nightcharge") do |p| 
      
        if(p.placename==params[:place])
        @total_price=(p.daycharge.to_i*@days.to_i)+(p.nightcharge.to_i*@nights.to_i)
        end
    end 
    

  end



end