<template>
  <section class="hero">
    <div class="hero-inner">
      <div class="hero-content">
        <h1 class="hero-title">WakeupSchedule</h1>
        <p class="hero-subtitle">智能课程表，校园生活好帮手</p>
        <div class="hero-tags">
          <span>秒进</span>
          <span>功能全</span>
          <span>自定义外观</span>
          <span>多平台</span>
          <span>小部件</span>
        </div>
        <div class="hero-buttons">
          <DownloadCard
            v-for="item in platforms"
            :key="item.name"
            :name="item.name"
            :icon="item.icon"
            :url="item.url"
            :color="item.color"
          />
        </div>
      </div>
      <div class="hero-image">
        <div class="phone-frame">
          <div class="phone-screen">
            <div class="mock-schedule">
              <div class="mock-header">
                <span>第3周</span>
                <span>2024/09/16</span>
              </div>
              <div class="mock-days">
                <span v-for="d in ['一','二','三','四','五']" :key="d">{{ d }}</span>
              </div>
              <div class="mock-grid">
                <div class="mock-course c1" style="grid-row: 1/3; grid-column: 1;">高等数学</div>
                <div class="mock-course c2" style="grid-row: 1/3; grid-column: 3;">英语听力</div>
                <div class="mock-course c3" style="grid-row: 3/5; grid-column: 2;">线性代数</div>
                <div class="mock-course c4" style="grid-row: 3/5; grid-column: 4;">程序设计</div>
                <div class="mock-course c5" style="grid-row: 5/7; grid-column: 1;">大学物理</div>
                <div class="mock-course c1" style="grid-row: 5/7; grid-column: 5;">体育</div>
                <div class="mock-course c6" style="grid-row: 7/9; grid-column: 3;">思想政治</div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<script setup>
import DownloadCard from './DownloadCard.vue'

const platforms = [
  {
    name: 'Android 版',
    icon: 'Monitor',
    url: '#download',
    color: '#34a853'
  },
  {
    name: 'iOS 版',
    icon: 'Iphone',
    url: '#download',
    color: '#007aff'
  },
  {
    name: '鸿蒙 NEXT 版',
    icon: 'Connection',
    url: '#download',
    color: '#e60012'
  }
]
</script>

<style lang="scss" scoped>
.hero {
  padding: 120px 0 80px;
  background: linear-gradient(135deg, #f5f0ff 0%, #ede9fe 30%, #e0e7ff 100%);
  overflow: hidden;
}

.hero-inner {
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 24px;
  display: flex;
  align-items: center;
  gap: 60px;

  @media (max-width: 768px) {
    flex-direction: column;
    text-align: center;
  }
}

.hero-content {
  flex: 1;
}

.hero-title {
  font-size: 52px;
  font-weight: 800;
  color: #1a1a2e;
  margin-bottom: 16px;
  line-height: 1.1;

  @media (max-width: 768px) {
    font-size: 36px;
  }
}

.hero-subtitle {
  font-size: 20px;
  color: #666;
  margin-bottom: 24px;
}

.hero-tags {
  display: flex;
  gap: 12px;
  flex-wrap: wrap;
  margin-bottom: 36px;

  @media (max-width: 768px) {
    justify-content: center;
  }

  span {
    padding: 6px 16px;
    background: rgba(124, 58, 237, 0.1);
    color: #7c3aed;
    border-radius: 20px;
    font-size: 14px;
    font-weight: 500;
  }
}

.hero-buttons {
  display: flex;
  gap: 12px;
  flex-wrap: wrap;

  @media (max-width: 768px) {
    justify-content: center;
  }
}

.hero-image {
  flex-shrink: 0;

  @media (max-width: 768px) {
    transform: scale(0.85);
  }
}

.phone-frame {
  width: 280px;
  height: 560px;
  background: #1a1a2e;
  border-radius: 36px;
  padding: 12px;
  box-shadow: 0 20px 60px rgba(0, 0, 0, 0.15);
}

.phone-screen {
  width: 100%;
  height: 100%;
  background: #fff;
  border-radius: 26px;
  overflow: hidden;
}

.mock-schedule {
  padding: 16px 8px;
  height: 100%;
}

.mock-header {
  display: flex;
  justify-content: space-between;
  padding: 8px;
  font-size: 13px;
  color: #333;
  font-weight: 600;
  margin-bottom: 8px;
}

.mock-days {
  display: grid;
  grid-template-columns: repeat(5, 1fr);
  text-align: center;
  font-size: 12px;
  color: #999;
  margin-bottom: 8px;
}

.mock-grid {
  display: grid;
  grid-template-columns: repeat(5, 1fr);
  grid-template-rows: repeat(10, 38px);
  gap: 3px;
}

.mock-course {
  border-radius: 6px;
  padding: 4px;
  font-size: 10px;
  color: #fff;
  font-weight: 500;
  display: flex;
  align-items: center;
  justify-content: center;
  text-align: center;
  line-height: 1.2;
}

.c1 { background: rgba(124, 58, 237, 0.8); }
.c2 { background: rgba(59, 130, 246, 0.8); }
.c3 { background: rgba(245, 158, 11, 0.8); }
.c4 { background: rgba(16, 185, 129, 0.8); }
.c5 { background: rgba(239, 68, 68, 0.8); }
.c6 { background: rgba(236, 72, 153, 0.8); }
</style>
