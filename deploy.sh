#!/usr/bin/env bash
set -euo pipefail
# Meltype 一键安装脚本（第三方指南）——按官方文档封装
# 官方文档：https://github.com/yksr-melt/Meltype/blob/main/README.md
# 更新日期：2026-10-28
# 类型：binary
cd "$(dirname "${BASH_SOURCE[0]}")"

command -v curl >/dev/null 2>&1 || { echo "需要先安装 curl"; exit 1; }

mkdir -p .download
cd .download

if [ "$(uname -s)" = "Darwin" ]; then url=https://github.com/yksr-melt/Meltype/releases/download/v1.4.0/Meltype-1.4.0-mac.zip ; want=2ab38a85acd1b5f7098a0850fb52fc2c9c3e4bd3089ccaaf185ce419d7ec0e35 ; file=Meltype.zip ; else if [ "$(uname -m)" = "aarch64" ] || [ "$(uname -m)" = "arm64" ]; then url=https://github.com/yksr-melt/Meltype/releases/download/v1.4.0/meltype_1.4.0_arm64.deb ; want=dfcf3a7e358f8f58ffbc8a3f226e21d0be9bbbae292a36b1c7c835ee3b7d2ce8 ; file=meltype.deb ; else url=https://github.com/yksr-melt/Meltype/releases/download/v1.4.0/meltype_1.4.0_amd64.deb ; want=015b5124ce8c0a5e1a003019235d310c1ae1845511e24bd2197800cdd6099ca9 ; file=meltype.deb ; fi ; fi
curl -fL -o "$file" "$url"
if [ "$file" = "meltype.deb" ]; then echo "$want  $file" | sha256sum -c - ; sudo dpkg -i "$file" || sudo apt-get install -f -y ; else echo "$want  $file" | shasum -a 256 -c - ; unzip -o "$file" ; open Meltype.app ; fi

echo ""

echo "安装完成：启动 Meltype，Windows 安装时同意管理员权限即可注册 IME；用 Win + Space 切换输入法"
echo "若结果异常或需要改配置，请参考官方文档：https://github.com/yksr-melt/Meltype/blob/main/README.md"
