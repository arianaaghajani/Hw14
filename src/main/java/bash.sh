#!/bin/bash
done_file="done_tasks.txt"
todo_file="todo_tasks.txt"
deleted_file="deleted_task.txt"

touch $done_file
touch $todo_file
touch $deleted_file

show_tasks(){
  status=$1
  case $status in
   "todo")
   echo "tasks to do:"
   cat $todo_file
    ;;
  "done")
  echo "tasks done:"
  cat $done_file
    ;;
  "deleted")
  echo "tasks deleted"
  cat deleted_file
  ;;
  esac
}
show_todo(){
  echo "Uncompleted tasks "
  cat $todo_file
}

add_todo(){
  echo "$1" >> $todo_file
  echo "1$ : new task added"
}

complete_task(){
  task=$1
  sed -i "/$task/d" $todo_file
  echo "$task" >> $done_file
  echo "task \"$task\"added new task succesfully"
}

deleted_task(){
  task=$1
  sed -i -i "/$task/d" $deleted_file
  echo "$task" >> $deleted_file
  echo "task \"$task\"deleted"
}