class TodoList
  def initialize
    @todos = []
  end

  def add(todo)
    # add todo to todo list
    @todos << todo
  end

  def all
    # lists all of the todos
    @todos
  end
end
