class PagesController < ApplicationController
  
  def index
  		@pages="Balaji"
  end

 def new
  	

    #@rowvalues=Place.find_by_placename(params[:place])
    #@rowvalues=Place.where("placename = ?", params[:place]).first
    #@query = Place.select(:placename).first
    #p=Place.new
    ####p.save

    #Place.find(1).destroy
    #Place.find(2).destroy
    #Place.find(3).destroy
    #Place.find(4).destroy
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



def add_place
    
    p=Place.new
    
    if (params[:placename]!="" && params[:daycharge]!="" && params[:nightcharge]!="" && !params[:placename].nil? )
                p.daycharge=params[:daycharge]
                p.nightcharge=params[:nightcharge]
                p.placename=params[:placename]
                 if p.save
                flash[:success] = "Place added "
                end
    else
        flash[:warning] = "field cant be blank"
        render :add_place

    end
 

    @all_data=params[:daycharge]


    @user="Balaji"


end

def add_place_params
    params.require(:place).permit(:placename, :daycharge,:nightcharge)
  end


end