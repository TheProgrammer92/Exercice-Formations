<template>
  <div id="app">

    <carousel>
      <carousel-slide>salut mes gens</carousel-slide>

      <carousel-slide>Aurevoir a vous mes gens</carousel-slide>

    </carousel>

  </div>
</template>

<script>
import Carousel from './components/carousel/Carousel.vue'
import CarouselSlide from './components/carousel/CarouselSlide.vue'
export default {
  components: {
    Carousel,
    CarouselSlide
  }
}

</script>
