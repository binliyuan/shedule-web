import { createServer } from 'http'
import { readFileSync, existsSync } from 'fs'
import { join, extname } from 'path'
import { fileURLToPath } from 'url'

const __dirname = fileURLToPath(new URL('.', import.meta.url))
const DIST = join(__dirname, 'dist')
const PORT = process.env.PORT || 80

const MIME = {
  '.html': 'text/html; charset=utf-8',
  '.js': 'application/javascript',
  '.css': 'text/css',
  '.json': 'application/json',
  '.png': 'image/png',
  '.jpg': 'image/jpeg',
  '.svg': 'image/svg+xml',
  '.ico': 'image/x-icon',
  '.woff': 'font/woff',
  '.woff2': 'font/woff2',
}

const server = createServer((req, res) => {
  let url = req.url.split('?')[0]

  // /api/ 反向代理到后端
  if (url.startsWith('/api/')) {
    const proxyReq = require('http').request(
      { hostname: '127.0.0.1', port: 8012, path: req.url, method: req.method, headers: req.headers },
      (proxyRes) => {
        res.writeHead(proxyRes.statusCode, proxyRes.headers)
        proxyRes.pipe(res)
      }
    )
    req.pipe(proxyReq)
    proxyReq.on('error', () => { res.writeHead(502); res.end('Bad Gateway') })
    return
  }

  let filePath = join(DIST, url)

  if (!existsSync(filePath) || url === '/') {
    const tryIndex = join(DIST, url, 'index.html')
    if (existsSync(tryIndex)) {
      filePath = tryIndex
    } else {
      // Vue Router history 模式 fallback
      filePath = join(DIST, 'index.html')
    }
  }

  if (!existsSync(filePath)) {
    res.writeHead(404)
    res.end('Not Found')
    return
  }

  const ext = extname(filePath)
  const contentType = MIME[ext] || 'application/octet-stream'

  try {
    const content = readFileSync(filePath)
    res.writeHead(200, { 'Content-Type': contentType })
    res.end(content)
  } catch {
    res.writeHead(500)
    res.end('Internal Server Error')
  }
})

server.listen(PORT, '0.0.0.0', () => {
  console.log(`\n  Schedule Web running at http://0.0.0.0:${PORT}\n`)
})
