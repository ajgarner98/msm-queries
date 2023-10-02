class DirectorsController < ApplicationController
  def index
    render({:template => "director_templates/list"})
  end
  def show
    the_id = params.fetch("the_id")
    matching_records= Director.where({:id => the_id})
    @the_director = matching_records.at(0)
    render({:template => "director_templates/details"})
  end
  def show_eldest
    director_dob_asc = Director.all.where.not({:dob => nil}).order({:dob => :asc})
    @eldest = director_dob_asc.at(0)
    render({:template => "director_templates/eldest"})
  end

  def show_youngest
    director_dob_desc = Director.all.where.not({:dob => nil}).order({:dob => :desc})
    @youngest = director_dob_desc.at(0)

    render({:template => "director_templates/youngest"})
  end
end
