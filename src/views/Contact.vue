<template>
  <div class="page-container">
    <h1>联系我们</h1>
    <div class="content">
      <div class="contact-grid">
        <div class="contact-card">
          <el-icon :size="32" color="#7c3aed"><Message /></el-icon>
          <h3>电子邮箱</h3>
          <a href="mailto:support@wakeschedule.com">support@wakeschedule.com</a>
        </div>

        <div class="contact-card">
          <el-icon :size="32" color="#7c3aed"><ChatDotSquare /></el-icon>
          <h3>意见反馈</h3>
          <p>在应用内 「我的 → 意见反馈」 提交</p>
        </div>

        <div class="contact-card">
          <el-icon :size="32" color="#7c3aed"><Link /></el-icon>
          <h3>GitHub</h3>
          <a href="https://github.com" target="_blank">项目主页</a>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { Message, ChatDotSquare, Link } from '@element-plus/icons-vue'
</script>

<style lang="scss" scoped>
.page-container {
  max-width: 800px;
  margin: 0 auto;
  padding: 100px 24px 60px;

  h1 {
    font-size: 32px;
    color: #1a1a2e;
    margin-bottom: 32px;
  }
}

.contact-grid {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 24px;

  @media (max-width: 768px) {
    grid-template-columns: 1fr;
  }
}

.contact-card {
  text-align: center;
  padding: 40px 24px;
  border: 1px solid #f0f0f0;
  border-radius: 16px;
  transition: all 0.3s;

  &:hover {
    box-shadow: 0 8px 30px rgba(0, 0, 0, 0.08);
  }

  h3 {
    font-size: 18px;
    color: #1a1a2e;
    margin: 16px 0 8px;
  }

  p {
    color: #999;
    font-size: 14px;
  }

  a {
    color: #7c3aed;
    text-decoration: none;
    font-size: 14px;

    &:hover {
      text-decoration: underline;
    }
  }
}
</style>
