# https://github.com/nyc-nighthawks-2017/ajax-checkpoint-challenge/tree/solo-sbrady11
# complete project there
# Follows a link, renders what the erb file says
get '/horses' do
  @horses = Horse.all
  erb :"/horses/index"
end

# Executes a form with the params passed
get '/horses/new' do
  @horse = Horse.new
  if request.xhr?
    erb :'/partials/_new_horse_form', layout: false
  else
    erb :"/horses/new"
  end
end

#################################

<form id="new-horse-form" class="flex flex-row" method="post" action="/horses">
<label class="input-group col-1-3">
  <input id="horse-name" class="input-group-input" type="text" name="horse[name]" value="<%= @horse.try(:name) %>">
  <span class="input-group-label">Name:</span>
</label>

<label class="input-group col-1-3">
  <input id="horse-age" class="input-group-input" type="text" name="horse[age]" value="<%= @horse.try(:age) %>">
  <span class="input-group-label">Age:</span>
</label>

<label class="input-group col-1-3">
  <input id="horse-breed" class="input-group-input" type="text" name="horse[breed]" value="<%= @horse.try(:breed) %>">
  <span class="input-group-label">Breed:</span>
</label>

<button type="submit" class="button dark">Submit</button>
</form>

###################################

#Takes data from the previous get
post '/horses' do
  @horse = Horse.new(params[:horse])
  if @horse.save
    if request.xhr?
      erb :'/partials/_horse_list', layout: false, locals: { horse: @horse }
    else
      redirect "/horses/#{@horse.id}"
    end
  else
    erb :"/horses/new"
  end
end


get '/horses/:id' do
  @horse = Horse.find(params[:id])
  if request.xhr?
    erb :'partials/_show_horse', layout: false, locals: { horse: @horse }
  else
    erb :"/horses/show"
  end
end
