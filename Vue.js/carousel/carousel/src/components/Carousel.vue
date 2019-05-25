<template>

  <div>
    <slot></slot>

  </div>

</template>

<script>
  export default {
    data () {
      console.log('salut je suis je ne mange pasheser')
      return {
        index: 0,
        slides: []
      }
    },
    mounted () {
      console.log(this.$children)
      console.log('salut tout le monde!! , je suis TheProgrammer')
    }
  }
</script>
