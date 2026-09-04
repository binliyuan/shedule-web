<template>
  <a class="download-card" :href="url" :style="{ '--btn-color': color }">
    <el-icon :size="20"><component :is="icon" /></el-icon>
    <span>{{ name }}</span>
  </a>
</template>

<script setup>
defineProps({
  name: String,
  icon: String,
  url: String,
  color: { type: String, default: '#7c3aed' }
})
</script>

<style lang="scss" scoped>
.download-card {
  display: inline-flex;
  align-items: center;
  gap: 8px;
  padding: 12px 24px;
  background: var(--btn-color);
  color: #fff;
  border-radius: 12px;
  text-decoration: none;
  font-size: 15px;
  font-weight: 600;
  transition: all 0.2s;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);

  &:hover {
    transform: translateY(-2px);
    box-shadow: 0 6px 20px rgba(0, 0, 0, 0.15);
  }
}
</style>
