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
    p=Place.where("placename= ? AND days= ? AND nights= ?", params[:place], params[:days], params[:nights])
    print.to_s
    @days = params[:days]
    @nights = params[:nights] 
    @place = params[:place]
    @rowvalues=Place.select("@place, daycharge")

    Place.select("placename, days,nights") do |p| 
      
        if(p.placename==params[:place] && p.days==params[:days])
               # @price=p.price

        @total_price=(p.days.to_i*@days.to_i)+(p.nights.to_i*@nights.to_i)
        end
    end 
  end

def add_place
    p=Place.new
    
    if (params[:place_package_name]!="" && params[:place_number_days]!="" && params[:place_number_nights]!="" && params[:place_placename]!="" && params[:place_package_category]!="" && params[:place_package_price]!="" && params[:place_package_facility]!="" && !params[:place_placename].nil?  )
                
                p.placename=params[:place_placename]
                p.days=params[:place_number_days]
                p.nights=params[:place_number_nights]
                p.packagename=params[:place_package_name]
                p.category=params[:place_package_category]
                p.facility=params[:place_package_facility]
                p.price=params[:place_package_price]
                 if p.save
                flash[:success] = "Place added "
                end
    else
        flash[:warning] = "field cant be blank"
        render :add_place
``                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
    end
    @all_data=params[:daycharge]
    @user="Balaji"

end

def add_place_params
    params.require(:place).permit(:placename, :daycharge,:nightcharge)
  end


end