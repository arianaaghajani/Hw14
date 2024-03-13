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