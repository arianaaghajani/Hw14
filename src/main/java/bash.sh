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
  sed -i "/$task/d" $deleted_file
  echo "$task" >> $deleted_file
  echo "task \"$task\"deleted"
}


show_todo
add_todo "java homework"
add_todo "buy bread"

show_todo
complete_task "java homework"

echo ""
show_todo
echo "completed tasks"
cat $done_file

deleted_task 1

//2
create_files(){
  for i in {1..5}; do
      touch "file${i}.txt"
  done
  echo "five text files created "
}

append_text(){
  for i in {1..5}; do
    echo "Hello world" >> "file${i}.txt"
  done
  echo "text 'hello world' appended to the files"
}

replace_text(){
  for i in {1..5}; do
    sed -i 's/world/bash/g' "file${i}.txt"
  done
  echo "word 'world' replace with 'bash' in the files"
}

while true; do
  echo "Menu: "
  echo "1. create five text files"
  echo "2. append 'Hello world' to the files"
  echo "3. replace 'world' with 'bash' in the files"
  echo "4. Exit"

  read -p "enter your choice: " choice

  case $choice in
  1) create_files ;;
  2) append_text ;;
  3) replace_text ;;
  4) echo "Exiting program" ; exit 0 ;;
  *) echo "invalid choice.Please select again" ;;
esac

done
