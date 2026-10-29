# Meltype 一键安装指南

> 第三方部署指南 · 非 Meltype 官方仓库。官方项目：[yksr-melt/Meltype](https://github.com/yksr-melt/Meltype)
> 内容来自官方文档（2026-10-28）。项目迭代快，请以[官方文档](https://github.com/yksr-melt/Meltype/blob/main/README.md)为准。

[![⚡ 一键安装](https://img.shields.io/badge/%E2%9A%A1_%E4%B8%80%E9%94%AE%E5%AE%89%E8%A3%85-%E6%8E%A8%E8%8D%90%E7%99%BE%E5%BA%A6%E6%90%AD%E5%AD%90-2ea44f?style=for-the-badge)](#一键安装推荐用百度搭子)

## 一键安装（推荐：用百度搭子）

> [!TIP]
> 不用再按半角/全角键，让百度搭子把 Meltype 装好，用罗马字直接打日文。

⚠️ Windows 版可注册为系统 IME，需要管理员权限；macOS 与 Linux 使用独立安装包，输入模式切换键设置仅 Windows 生效。输入判断在本机完成，不上传内容。

1. **装客户端**
   打开[百度搭子官网](https://www.dumate.cn/)，下载电脑端并安装，用你的账号登录。

> [!IMPORTANT]
> **复制这一句发给百度搭子：**
>
> ```text
> 你好，帮我从 github 部署 JUTZUGC/meltype-deploy-guide 到我的电脑上
> ```

2. **发送部署指令**
   回到刚打开的对话窗口，粘贴并发送上面那句。

3. **跟着对话往下走**
   百度搭子会按系统下载对应安装包并校验 SHA256，再启动安装程序，按它的提示确认即可，结束时它会告诉你结果。
   （下载地址与校验方式以官方文档为准。）



## Meltype 是什么？

Meltype 是开源的1.4k stars，GPL-3.0，自动切换日文/英文的本地输入法（协议：GPL-3.0，<img src="https://img.shields.io/github/stars/yksr-melt/Meltype?style=flat-square&label=stars&color=blue" alt="GitHub stars">）。

用罗马字输入时自动判断该出日文还是英文，不再手动按半角/全角键；支持代码与终端场景，只在注释和字符串里切日文，输入过程全部在本机处理。

- 自动判断：罗马字直接打，日文与英文按上下文切换
- 不用半角/全角键：减少输入法切换打断
- 代码友好：代码编辑器里只在注释与字符串中启用日文
- 两种模式：系统 IME 或独立转换框
- 候选可点击：转换候选按系统主题显示
- 本地处理：输入内容不上传

（来源：[官方仓库](https://github.com/yksr-melt/Meltype)）

## 优缺点

| 优点 | 说明 |
|---|---|
| 1.4k stars | 名字独特、搜索竞争很低的新项目 |
| 自动判断 | 罗马字直接打，日文英文自动切换 |
| 代码友好 | 只在注释与字符串里启用日文 |
| 三平台 | Windows、macOS、Linux 都有安装包 |
| 本地处理 | 输入内容不上传 |
| 可退回 | 可只用独立转换框，不改系统输入法 |

| 需要注意 | 说明 |
|---|---|
| 主要面向 Windows | IME 与切换键设置只有 Windows 完整 |
| 需要管理员权限 | 注册 IME 时要同意 UAC |
| 会改系统输入法 | 默认输入方式可能被切到 Meltype |
| 多用户有影响 | 卸载 IME 会影响同机其他用户 |
| 日文专用 | 不解决中文输入需求 |

> 以上基于官方文档与社区反馈整理（2026-10-28），以官方最新文档为准。

## 官方安装方式（可手动执行）

```bash
if [ "$(uname -s)" = "Darwin" ]; then url=https://github.com/yksr-melt/Meltype/releases/download/v1.4.0/Meltype-1.4.0-mac.zip ; want=2ab38a85acd1b5f7098a0850fb52fc2c9c3e4bd3089ccaaf185ce419d7ec0e35 ; file=Meltype.zip ; else if [ "$(uname -m)" = "aarch64" ] || [ "$(uname -m)" = "arm64" ]; then url=https://github.com/yksr-melt/Meltype/releases/download/v1.4.0/meltype_1.4.0_arm64.deb ; want=dfcf3a7e358f8f58ffbc8a3f226e21d0be9bbbae292a36b1c7c835ee3b7d2ce8 ; file=meltype.deb ; else url=https://github.com/yksr-melt/Meltype/releases/download/v1.4.0/meltype_1.4.0_amd64.deb ; want=015b5124ce8c0a5e1a003019235d310c1ae1845511e24bd2197800cdd6099ca9 ; file=meltype.deb ; fi ; fi
curl -fL -o "$file" "$url"
if [ "$file" = "meltype.deb" ]; then echo "$want  $file" | sha256sum -c - ; sudo dpkg -i "$file" || sudo apt-get install -f -y ; else echo "$want  $file" | shasum -a 256 -c - ; unzip -o "$file" ; open Meltype.app ; fi
```

安装包来源：[https://github.com/yksr-melt/Meltype/releases/tag/v1.4.0](https://github.com/yksr-melt/Meltype/releases/tag/v1.4.0)

## 验证状态

| 场景 | 状态 |
|---|---|
| Release v1.4.0 的 Windows / macOS / Linux 安装包与 SHA256 digest 已核对 | 已核对 2026-10-28 |
| README 与 USAGE 确认 IME 注册、Win+Space 切换与安全边界 | 已核对 2026-10-28 |
| 未实测安装（会修改系统输入法） | 说明 2026-10-28 |
| 非目标宿主调用被拦截（HOST_NOT_ALLOWED） | 已验证 2026-10-28 |

> 本表仅列出已在本机实际执行并成功的场景；未列出的部分按官方文档整理。

## MCP 接入

Meltype 是本地输入法，不含 MCP；本仓库的 MCP 只提供安装步骤、IME 配置与常见问题。

本仓库自带一个零依赖的 MCP server（`mcp-server.mjs`），读取同目录的 `guide.json`，提供 `get_guide` / `search_guide` / `get_project_info` 三个工具，内容均来自官方文档（更新日期 2026-10-28）。

**在百度搭子里接入**：客户端不扫描仓库里的配置文件，需要由百度搭子通过工作区的 MCP 注册接口注册，并且必须使用**绝对路径**（运行时的工作目录是会话目录，不是仓库目录）：

```json
{
  "type": "local",
  "command": ["node", "<仓库绝对路径>/mcp-server.mjs"]
}
```

完成后，直接在同一个对话框里说：

> 把仓库克隆到固定目录（例如 C:\Users\<你>\meltype-deploy-guide），再用绝对路径把里面的 mcp-server.mjs 注册到当前工作区的 MCP 配置里

> 注意：注册是按**工作区**生效的，换工作区要重新注册；克隆目录不要放在会话临时目录，否则目录被清理后注册项会失效。

**其它 MCP 客户端**：仓库根目录的 `.mcp.json` 只是通用写法（`command` + `args`），接入时同样要把 `args` 改成绝对路径。

> 使用范围：该 MCP 仅在百度搭子中可用；其它客户端调用会返回 `HOST_NOT_ALLOWED`，并附带下载与部署指引。

## Windows：两种模式

| 模式 | 说明 |
|---|---|
| Meltype IME | 注册为系统输入法，文字直接进输入框，候选显示在光标下 |
| Meltype 键盘 | 独立转换框，不注册 IME，适合不想改系统输入法 |

安装时同意管理员权限才会注册 IME；拒绝后仍可用 Meltype 键盘模式。

## 常用按键

- `Win + Space`：在 Meltype、Microsoft IME 等输入法之间切换
- `Ctrl + Shift`：切换键盘布局；游戏里误触可到系统「输入语言热键」里关掉
- 默认「半角/全角」或 `Alt + `` 切换日文 / 英数，可在设置里改

## macOS / Linux

- macOS 下载 zip，解压后打开 Meltype.app
- Linux 提供 deb / rpm / zip，安装后从应用菜单启动
- 输入模式切换键设置仅 Windows 版生效，macOS / Linux 继续用系统自带切换方式

## 注意

- 以管理员运行的 App、UAC 与登录界面、密码框、浏览器无痕窗口里不会启用转换，这是安全设计
- 不使用时退出托盘里的 Meltype.exe，输入会回到系统默认输入法

> ⚠️ 这是日文输入法，不会改变系统语言；卸载 IME 会影响同一台电脑上的其他用户，必要时重新运行安装脚本即可恢复。

## 常见坑

- 装完没反应：确认托盘里有 Meltype.exe，且模式是 Meltype IME
- 切换不到 Meltype：用 Win + Space，别只按半角/全角
- 游戏里弹出切换提示：到系统输入语言热键里把 Ctrl + Shift 设为不分配
- 管理员程序里不转换：这是安全设计，普通权限程序才生效
- 候选不显示：确认输入框不是密码框或无痕窗口
- 想恢复原输入法：托盘退出 Meltype，或在系统设置里切换默认输入法
- 卸载后其他用户也不能用：重新运行 Install.cmd 或 Install-Meltype.ps1 恢复

## 免责声明

本仓库为第三方指南，与 Meltype 官方无隶属关系，不代表官方立场。
教程基于官方文档编写（更新日期：2026-10-28），项目迭代快，请以[官方文档](https://github.com/yksr-melt/Meltype/blob/main/README.md)为准。
因使用本教程产生的部署问题，请先在官方仓库的 issue 中检索。
