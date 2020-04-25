<template>
  <div class="photo-list">
    <div class="grid">
      <Photo
        :item="photo"
        :key="photo.id"
        class="grid__item"
        v-for="photo in photos"
      />
    </div>
  </div>
</template>

<script>
import { OK } from '../util'
import Photo from '../components/Photo.vue'

export default {
  components: {
    Photo
  },
  data() {
    return {
      photos: []
    }
  },
  methods: {
    async fetchPhotos() {
      const response = await axios.get('/api/photos')

      if(response.status !== OK) {
        this.$store.commit('error/setCode', response.status)
        return false
      }

      this.photos = response.data.data
    }
  },
  watch: {
    $route: {
      async handler() {
        await this.fetchPhotos()
      },
      immediate: true
    }
  }
}
</script>
