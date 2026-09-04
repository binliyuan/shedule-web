<template>
  <section id="features" class="features">
    <div class="features-inner">
      <h2 class="section-title">功能亮点</h2>
      <p class="section-desc">专为大学生设计的课程表应用</p>

      <div class="feature-grid">
        <div v-for="(item, i) in features" :key="i" class="feature-card">
          <div class="feature-icon" :style="{ background: item.bg }">
            <el-icon :size="28" :color="item.iconColor"><component :is="item.icon" /></el-icon>
          </div>
          <h3>{{ item.title }}</h3>
          <p>{{ item.desc }}</p>
        </div>
      </div>
    </div>
  </section>
</template>

<script setup>
const features = [
  {
    icon: 'Lightning',
    title: '极速开启',
    desc: '启动优化做到极致，即点即看，无需等待',
    bg: 'rgba(124, 58, 237, 0.1)',
    iconColor: '#7c3aed'
  },
  {
    icon: 'Cpu',
    title: '小巧强大',
    desc: '安装包体积极小，专注课表功能，纯净体验',
    bg: 'rgba(59, 130, 246, 0.1)',
    iconColor: '#3b82f6'
  },
  {
    icon: 'Monitor',
    title: '多平台支持',
    desc: '支持 iOS、鸿蒙 NEXT 和 Android 三大平台',
    bg: 'rgba(16, 185, 129, 0.1)',
    iconColor: '#10b981'
  },
  {
    icon: 'Files',
    title: '多课表切换',
    desc: '多课表存储并自由切换，设置互相独立',
    bg: 'rgba(245, 158, 11, 0.1)',
    iconColor: '#f59e0b'
  },
  {
    icon: 'Brush',
    title: '外观自定义',
    desc: '丰富的自定义选项，打造专属课表风格',
    bg: 'rgba(236, 72, 153, 0.1)',
    iconColor: '#ec4899'
  },
  {
    icon: 'Grid',
    title: '桌面小部件',
    desc: '精美的桌面小部件，无需打开应用即可查看课程',
    bg: 'rgba(239, 68, 68, 0.1)',
    iconColor: '#ef4444'
  }
]
</script>

<style lang="scss" scoped>
.features {
  padding: 80px 0;
  background: #fff;
}

.features-inner {
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

.feature-grid {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 24px;

  @media (max-width: 768px) {
    grid-template-columns: repeat(2, 1fr);
  }

  @media (max-width: 480px) {
    grid-template-columns: 1fr;
  }
}

.feature-card {
  padding: 32px 24px;
  border-radius: 16px;
  border: 1px solid #f0f0f0;
  transition: all 0.3s;

  &:hover {
    box-shadow: 0 8px 30px rgba(0, 0, 0, 0.08);
    transform: translateY(-4px);
  }

  .feature-icon {
    width: 56px;
    height: 56px;
    border-radius: 14px;
    display: flex;
    align-items: center;
    justify-content: center;
    margin-bottom: 20px;
  }

  h3 {
    font-size: 18px;
    color: #1a1a2e;
    margin-bottom: 8px;
  }

  p {
    font-size: 14px;
    color: #999;
    line-height: 1.6;
  }
}
</style>
