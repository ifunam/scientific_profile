class JournalsController < InheritedResources::Base
  respond_to :json, :only => [:autocomplete_search]
  respond_to :js, :only => [:show, :new, :autocomplete_form]

  def autocomplete_search
     @records = Journal.search params[:term]
     @results = @records.collect { |record| {:id => record.id, :value => record.name, :label => record.name} }
     render :json => @results
  end

   def autocomplete_form
      render :action => 'autocomplete_form.js'
   end

   def create
     create! do |format|
       format.js { render :action => 'create.js' }
     end
   end
end