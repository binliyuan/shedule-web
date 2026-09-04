# WakeupSchedule 官网

WakeupSchedule 课程表应用的下载页 / 产品展示网站。

## 技术栈

- Vue 3 + Composition API
- Vite
- Vue Router 4
- Element Plus
- SCSS

## 开发

```bash
# 安装依赖
npm install

# 启动开发服务器
npm run dev
# 访问 http://localhost:3000

# 构建生产版本
npm run build
# 输出到 dist/
```

## 页面

| 路径 | 页面 |
|------|------|
| `/` | 首页 — Hero + 功能介绍 + 下载 |
| `/privacy` | 隐私政策 |
| `/contact` | 联系我们 |

## 下载链接配置

编辑 `src/views/Home.vue` 中的 `platforms` 数组替换真实的应用商店链接：

```js
const platforms = [
  { name: 'Android', url: 'https://应用宝链接', ... },
  { name: 'iOS', url: 'https://AppStore链接', ... },
  { name: '鸿蒙 NEXT', url: 'https://华为应用市场链接', ... }
]
```
