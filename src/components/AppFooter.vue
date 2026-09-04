<template>
  <footer class="app-footer">
    <div class="footer-inner">
      <div class="footer-grid">
        <div class="footer-brand">
          <div class="logo">
            <span class="logo-icon">W</span>
            <span>WakeupSchedule</span>
          </div>
          <p class="slogan">智能课程表，校园生活好帮手</p>
        </div>

        <div class="footer-links">
          <h4>资源</h4>
          <a href="#features">功能介绍</a>
          <a href="#download">下载应用</a>
          <router-link to="/privacy">隐私政策</router-link>
        </div>

        <div class="footer-links">
          <h4>联系我们</h4>
          <router-link to="/contact">联系方式</router-link>
          <a href="mailto:support@wakeschedule.com">电子邮箱</a>
        </div>

        <div class="footer-links">
          <h4>相关</h4>
          <a href="https://github.com" target="_blank">GitHub</a>
        </div>
      </div>

      <div class="footer-bottom">
        <p>&copy; 2024 WakeupSchedule. All rights reserved.</p>
      </div>
    </div>
  </footer>
</template>

<style lang="scss" scoped>
.app-footer {
  background: #1a1a2e;
  color: #ccc;
  padding: 60px 0 0;
}

.footer-inner {
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 24px;
}

.footer-grid {
  display: grid;
  grid-template-columns: 2fr 1fr 1fr 1fr;
  gap: 40px;
  padding-bottom: 40px;
  border-bottom: 1px solid #2a2a4e;

  @media (max-width: 768px) {
    grid-template-columns: 1fr 1fr;
    gap: 30px;
  }

  @media (max-width: 480px) {
    grid-template-columns: 1fr;
  }
}

.footer-brand {
  .logo {
    display: flex;
    align-items: center;
    gap: 10px;
    font-weight: 700;
    font-size: 18px;
    color: #fff;
    margin-bottom: 12px;
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

  .slogan {
    color: #999;
    font-size: 14px;
  }
}

.footer-links {
  h4 {
    color: #fff;
    font-size: 15px;
    margin-bottom: 16px;
  }

  a {
    display: block;
    color: #999;
    text-decoration: none;
    font-size: 14px;
    margin-bottom: 10px;
    transition: color 0.2s;

    &:hover {
      color: #a855f7;
    }
  }
}

.footer-bottom {
  padding: 24px 0;
  text-align: center;
  font-size: 13px;
  color: #666;
}
</style>
