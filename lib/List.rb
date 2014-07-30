class List
  def initialize (list_name)
  @list_name = list_name
  @tasks = []
  @finished = []
  end

  def list_name
    @list_name
  end

  def tasks
    @tasks
  end

  def finished
    @finished
  end

  def add_task (task_description)
    @tasks << task_description
  end

  def finish_task (task_number)
    @finished << @tasks[(task_number)-1]
    @tasks.slice!((task_number)-1)
  end

end
