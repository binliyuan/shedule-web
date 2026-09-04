<template>
  <header class="app-header">
    <div class="header-inner">
      <router-link to="/" class="logo">
        <span class="logo-icon">W</span>
        <span class="logo-text">WakeupSchedule</span>
      </router-link>
      <nav class="nav-links">
        <router-link to="/">首页</router-link>
        <a href="#features">功能介绍</a>
        <a href="#download">下载</a>
        <router-link to="/privacy">隐私政策</router-link>
        <router-link to="/contact">联系我们</router-link>
      </nav>
      <el-button class="mobile-menu" text @click="menuOpen = !menuOpen">
        <el-icon :size="24"><Menu /></el-icon>
      </el-button>
    </div>
    <transition name="slide">
      <nav v-if="menuOpen" class="mobile-nav">
        <router-link to="/" @click="menuOpen = false">首页</router-link>
        <a href="#features" @click="menuOpen = false">功能介绍</a>
        <a href="#download" @click="menuOpen = false">下载</a>
        <router-link to="/privacy" @click="menuOpen = false">隐私政策</router-link>
        <router-link to="/contact" @click="menuOpen = false">联系我们</router-link>
      </nav>
    </transition>
  </header>
</template>

<script setup>
import { ref } from 'vue'
import { Menu } from '@element-plus/icons-vue'

const menuOpen = ref(false)
</script>

<style lang="scss" scoped>
.app-header {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  z-index: 100;
  background: rgba(255, 255, 255, 0.95);
  backdrop-filter: blur(10px);
  border-bottom: 1px solid #f0f0f0;
}

.header-inner {
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 24px;
  height: 64px;
  display: flex;
  align-items: center;
  justify-content: space-between;
}

.logo {
  display: flex;
  align-items: center;
  gap: 10px;
  text-decoration: none;
  color: #1a1a2e;
  font-weight: 700;
  font-size: 18px;
}

.logo-icon {
  width: 36px;
  height: 36px;
  background: linear-gradient(135deg, #7c3aed, #a855f7);
  border-radius: 10px;
  display: flex;
  align-items: center;
  justify-content: center;
  color: #fff;
  font-weight: 800;
  font-size: 20px;
}

.nav-links {
  display: flex;
  gap: 32px;

  a {
    text-decoration: none;
    color: #666;
    font-size: 15px;
    transition: color 0.2s;

    &:hover,
    &.router-link-active {
      color: #7c3aed;
    }
  }

  @media (max-width: 768px) {
    display: none;
  }
}

.mobile-menu {
  display: none;
  @media (max-width: 768px) {
    display: flex;
  }
}

.mobile-nav {
  display: flex;
  flex-direction: column;
  padding: 8px 24px 16px;
  background: #fff;
  border-bottom: 1px solid #f0f0f0;

  a {
    padding: 12px 0;
    text-decoration: none;
    color: #333;
    font-size: 15px;
    border-bottom: 1px solid #f8f8f8;

    &:last-child {
      border-bottom: none;
    }
  }
}

.slide-enter-active,
.slide-leave-active {
  transition: all 0.3s ease;
}
.slide-enter-from,
.slide-leave-to {
  opacity: 0;
  transform: translateY(-10px);
}
</style>
