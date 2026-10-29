# Meltype 一键安装脚本（第三方指南）——按官方文档封装
# 官方文档：https://github.com/yksr-melt/Meltype/blob/main/README.md
# 更新日期：2026-10-28
# 类型：binary
$ErrorActionPreference = 'Stop'
Set-Location -Path $PSScriptRoot

if (-not (Get-Command curl.exe -ErrorAction SilentlyContinue)) { throw '需要先安装 curl（Windows 10+ 自带 curl.exe）' }

New-Item -ItemType Directory -Force -Path .download | Out-Null
Set-Location -Path .download

curl.exe -L --fail -o Meltype-setup.exe "https://github.com/yksr-melt/Meltype/releases/download/v1.4.0/Meltype-1.4.0-setup.exe"
if ((Get-FileHash Meltype-setup.exe -Algorithm SHA256).Hash.ToLower() -ne 'aa1e19c239d93773e6f9a852bd297bc9ef2c849003f85c484999ac2059f29460') { throw 'SHA256 校验失败，请重新下载' }
Start-Process -FilePath .\Meltype-setup.exe

Write-Host ''

Write-Host '安装完成：启动 Meltype，Windows 安装时同意管理员权限即可注册 IME；用 Win + Space 切换输入法'
Write-Host '若结果异常或需要改配置，请参考官方文档：https://github.com/yksr-melt/Meltype/blob/main/README.md'
