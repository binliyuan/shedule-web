<template>
  <div id="schedule-app">
    <AppHeader />
    <main>
      <router-view />
    </main>
    <AppFooter />
  </div>
</template>

<script setup>
import AppHeader from '@/components/AppHeader.vue'
import AppFooter from '@/components/AppFooter.vue'
</script>

<style lang="scss">
#schedule-app {
  min-height: 100vh;
  display: flex;
  flex-direction: column;

  main {
    flex: 1;
  }
}
</style>
