<template>
  <div class="home">
    <HeroSection />
    <FeatureSection />

    <section id="download" class="download-section">
      <div class="download-inner">
        <h2 class="section-title">下载应用</h2>
        <p class="section-desc">选择你的平台，立即开始使用</p>

        <div class="platform-grid">
          <div v-for="item in platforms" :key="item.name" class="platform-card">
            <div class="platform-icon" :style="{ background: item.bg }">
              <el-icon :size="36" color="#fff"><component :is="item.icon" /></el-icon>
            </div>
            <h3>{{ item.name }}</h3>
            <p>{{ item.desc }}</p>
            <a :href="item.url" class="platform-btn" :style="{ background: item.color }" target="_blank">
              {{ item.btnText }}
            </a>
          </div>
        </div>
      </div>
    </section>
  </div>
</template>

<script setup>
import HeroSection from '@/components/HeroSection.vue'
import FeatureSection from '@/components/FeatureSection.vue'

const platforms = [
  {
    name: 'Android',
    icon: 'Monitor',
    desc: '支持 Android 8.0 及以上版本',
    url: 'https://sj.qq.com/',
    btnText: '应用宝下载',
    color: '#34a853',
    bg: 'linear-gradient(135deg, #34a853, #2d9348)'
  },
  {
    name: 'iOS',
    icon: 'Iphone',
    desc: '支持 iOS 15.0 及以上版本',
    url: 'https://apps.apple.com/',
    btnText: 'App Store 下载',
    color: '#007aff',
    bg: 'linear-gradient(135deg, #007aff, #0062cc)'
  },
  {
    name: '鸿蒙 NEXT',
    icon: 'Connection',
    desc: '支持 HarmonyOS NEXT 及以上版本',
    url: 'https://appgallery.huawei.com/',
    btnText: '华为应用市场下载',
    color: '#e60012',
    bg: 'linear-gradient(135deg, #e60012, #c4000f)'
  }
]
</script>

<style lang="scss" scoped>
.download-section {
  padding: 80px 0;
  background: #fafafa;
}

.download-inner {
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 24px;
}

.section-title {
  text-align: center;
  font-size: 36px;
  font-weight: 800;
  color: #1a1a2e;
  margin-bottom: 12px;
}

.section-desc {
  text-align: center;
  font-size: 16px;
  color: #999;
  margin-bottom: 48px;
}

.platform-grid {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 24px;

  @media (max-width: 768px) {
    grid-template-columns: 1fr;
    max-width: 400px;
    margin: 0 auto;
  }
}

.platform-card {
  background: #fff;
  border-radius: 20px;
  padding: 40px 32px;
  text-align: center;
  border: 1px solid #f0f0f0;
  transition: all 0.3s;

  &:hover {
    box-shadow: 0 12px 40px rgba(0, 0, 0, 0.08);
    transform: translateY(-4px);
  }

  .platform-icon {
    width: 72px;
    height: 72px;
    border-radius: 20px;
    display: flex;
    align-items: center;
    justify-content: center;
    margin: 0 auto 20px;
  }

  h3 {
    font-size: 22px;
    color: #1a1a2e;
    margin-bottom: 8px;
    font-weight: 700;
  }

  p {
    font-size: 14px;
    color: #999;
    margin-bottom: 24px;
  }

  .platform-btn {
    display: inline-block;
    padding: 12px 32px;
    color: #fff;
    border-radius: 12px;
    text-decoration: none;
    font-size: 15px;
    font-weight: 600;
    transition: all 0.2s;

    &:hover {
      opacity: 0.9;
      box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
    }
  }
}
</style>
