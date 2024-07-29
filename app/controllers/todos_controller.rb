class TodosController < ApplicationController
  before_action :authenticate_user!, only: [:create, :edit, :update, :destroy]
  before_action :set_todo, only: [:edit, :destroy, :update, :show]

  def index
    @todos = ToDo.page(params[:page]).per(3)
    render json: @todos, meta: pagination_meta(@todos)
  end

  def new
    @todo = ToDo.new
  end

  def create
    @todo = ToDo.new(todo_params)
    if @todo.save
      render json: @todo, status: :created
    else
      render json: @todo.errors, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @todo.update(todo_params)
      render json: @todo
    else
      render json: @todo.errors, status: :unprocessable_entity
    end
  end


  def destroy
    @todo.destroy
    # head :no_content
    render json: "#{@todo.title} was deleted"
  end

  def show
    render json: @todo
  end

  private

  def pagination_meta(todos)
    {
      current_page: todos.current_page,
      next_page: todos.next_page,
      prev_page: todos.prev_page,
      total_pages: todos.total_pages,
      total_count: todos.total_count
    }
  end

  def set_todo
    @todo = ToDo.find(params[:id])
  end

  def todo_params
    params.require(:to_do).permit(:title, :body, :is_active)
  end
end
