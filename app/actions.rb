# Homepage (Root path)
get '/' do
  erb :index
end

get '/tracks' do
  @tracks = Track.all 
  erb :'tracks/index'
end

get '/tracks/new' do 
  erb :'tracks/new'
end

post '/tracks' do 
  @track = Track.new(
    song_title: params[:song_title],
    artist: params[:artist],
    url: params[:url]
    )
  if @track.save
    redirect '/tracks'
  else
    erb :'tracks/new'
  end
end

get '/tracks/:id' do 
  @track = Track.find(params[:id])
  @other_tracks = Track.where(artist: @track.artist).where.not(id: @track.id).order('created_at DESC')
  erb :'tracks/show'
end

post '/register' do 
  @user = User.new(
    username: params[:username],
    password: params[:password]
    )
  @user.save
  redirect '/'
end

post '/login' do 
  user = User.find_by(username: params[:username], password: params[:password])
  if user
    session[:user_id] = user.id
    redirect '/tracks'
  else
    redirect '/'
  end
end
