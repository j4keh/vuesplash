<template>
  <div class="pagination">
    <RouterLink
      :to="`/?page=${currentPage - 1}`"
      class="button"
      v-if="!isFirstPage"
    >&laquo; prev
    </RouterLink>
    <RouterLink
      :to="`/?page=${currentPage + 1}`"
      class="button"
      v-if="!isLastPage"
    >next &raquo;
    </RouterLink>
  </div>
</template>

<script>
export default {
  props: {
    currentPage: {
      type: Number,
      required: true
    },
    lastPage: {
      type: Number,
      required: true
    }
  },
  computed: {
    isFirstPage() {
      return this.currentPage === 1
    },
    isLastPage() {
      return this.currentPage === this.lastPage
    }
  }
}
</script>
