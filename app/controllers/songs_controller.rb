class SongsController < ApplicationController
  before_action :set_song, only: [:show, :update, :destroy]

  # GET /todos
  def index
    if params[:search]
      @songs = Song.search(params[:search]).order("title").page
    else
      @songs = Song.order("title").page(params[:page])
    end
    json_response(@songs)
  end

  # POST /todos
  def create
    @todo = Todo.create!(todo_params)
    json_response(@todo, :created)
  end

  # GET /todos/:id
  def show
    json_response(@todo)
  end

  # PUT /todos/:id
  def update
    @todo.update(todo_params)
    head :no_content
  end

  # DELETE /todos/:id
  def destroy
    @todo.destroy
    head :no_content
  end

  private

  def song_params
    # whitelist params
    params.permit(:title, :created_by, :search, :page)
  end

  def set_song
    @todo = Todo.find(params[:id])
  end

end
