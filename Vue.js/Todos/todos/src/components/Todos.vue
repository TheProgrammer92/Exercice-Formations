<template>

   <section class="todoapp">

       <header class="header">

           <h1>todo</h1>

           <input type="text" name="" class="new-todo" id="" placeholder="ajouter un tachge" v-model="newTodo" @keyup.enter="addTodo()">
       </header>

       <div class="main">

           <ul class="todo-list">

               <li class="todo" v-for="todo in todos" :class="{completed: todo.completed}">

                   <div class="view">
                     <input type="checkbox"  v-model="todo.completed" class="toggle">

                       <label for=" "> {{ todo.name }}</label>
                   </div>
               </li>
           </ul>
       </div>

     <footer class="footer">
        <span class="todo-count">
          <strong>{{remaining}}</strong> Taches a faire
        </span>
       <ul class="filters">
         <li><a :class="{selected: filter ===  'all'}" href=""  @click.prevent="filter = 'all'">Toutes les tache</a></li>
         <li><a href="" :class="{selected: filter ===  'todo'}" @click.prevent="filter = 'todo'">A faire</a></li>
         <li><a href="" :class="{selected: filter ===  'done'}" @click.prevent="filter = 'done'">faites</a></li>
       </ul>

     </footer>
   </section>

</template>

<script>
  export default {
    data () {
      return {
        todos: [{
          name: 'Tache de test',
          completed: false
        }],
        newTodo: ''
      }
    },
    methods: {
      addTodo () {
        this.todos.push({
          completed: false,
          name: this.newTodo
        })
        this.newTodo = ''
      }
    },
    computed: {
      remaining () {
        return this.todos.filter(todo => !todo.completed).length
      }
    }
  }

</script>


<style src="./todos.css">

</style>
