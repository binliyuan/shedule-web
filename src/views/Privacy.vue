<template>
  <div class="page-container">
    <h1>隐私政策</h1>
    <div class="content">
      <p>WakeupSchedule 非常重视用户的隐私保护。本隐私政策说明了我们如何收集、使用和保护您的个人信息。</p>

      <h2>信息收集</h2>
      <p>我们仅收集为提供服务所必需的最少信息，包括：</p>
      <ul>
        <li>账号注册信息（用户名）</li>
        <li>课程表数据（用于云端同步）</li>
      </ul>

      <h2>信息使用</h2>
      <p>我们收集的信息仅用于：</p>
      <ul>
        <li>提供和改进课程表服务</li>
        <li>支持多设备间的数据同步</li>
      </ul>

      <h2>信息保护</h2>
      <p>我们采取合理的技术措施保护您的个人信息安全，包括数据加密传输和安全存储。</p>

      <h2>联系我们</h2>
      <p>如有任何关于隐私政策的问题，请通过<router-link to="/contact">联系我们</router-link>页面与我们取得联系。</p>
    </div>
  </div>
</template>

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

  h2 {
    font-size: 20px;
    color: #333;
    margin: 24px 0 12px;
  }

  p {
    color: #666;
    line-height: 1.8;
    margin-bottom: 12px;
  }

  ul {
    color: #666;
    padding-left: 24px;
    margin-bottom: 12px;

    li {
      margin-bottom: 6px;
      line-height: 1.6;
    }
  }

  a {
    color: #7c3aed;
  }
}
</style>
