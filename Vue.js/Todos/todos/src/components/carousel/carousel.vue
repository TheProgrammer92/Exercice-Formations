<template>

  <div>
    Index : {{index}}
    <slot></slot>

  </div>
</template>


<script>
  export default {
    data () {
      return {
        index: 0,
        slides: []
      }
    },
    mounted () {
      console.log('jesbeer')
      console.log(this.$children)
    }
  }
</script>
