# 小组 Flutter Web 展示页

7 人小组基于 Flutter 框架开发的团队展示页面，使用 GitHub Fork + Pull Request 模式协作，通过 GitHub Pages 发布。

## 目录

- [背景](#背景)
- [安装](#安装)
- [用法](#用法)
- [项目结构](#项目结构)
- [小组成员与分工](#小组成员与分工)
- [技术栈](#技术栈)
- [在线访问地址](#在线访问地址)
- [分支结构](#分支结构)
- [维护者](#维护者)
- [如何贡献](#如何贡献)
- [许可证](#许可证)

## 背景

本项目是**GitHub 协作与 Flutter Web 部署**的教学案例。小组成员各自负责修改页面中的不同内容区块，在独立分支上提交代码，通过 Pull Request 由组长审核后合并到主分支，最终构建为 Web 静态文件并部署到 GitHub Pages。

页面包含以下模块：

| 模块 | 内容 | 负责成员 |
|------|------|----------|
| 首页标题区（Hero） | 项目标题 `projectTitle` 与口号 `projectSlogan` | 组员 A 陈嘉玲 |
| 成员介绍 | 小组成员的姓名、角色、任务分工卡片列表 | 组员 B 廖春花 |
| 项目功能 | 项目功能说明列表 | 组员 C 杨顺粉 |
| 发布说明 | 部署方式与访问地址 | 组员 D 杨美媛 |
| 顶部导航栏 | 修改 AppBar 标题与浏览器标签页标题 | 组员 E 王怡婷 |
| 主题颜色 | 修改应用主题颜色（`Colors.indigo`） | 组员 F 岳沛珂 |

## 安装

### 前置条件

- [Flutter SDK](https://flutter.dev)（需启用 Web 支持）
- [Git](https://git-scm.com)
- Chrome 浏览器

### 步骤

```bash
# 1. 克隆仓库
git clone https://github.com/wendy-zhou6/group-cooperation-1.git
cd group-cooperation-1

# 2. 下载依赖
flutter pub get

# 3. 在浏览器中运行
flutter run -d chrome
```

运行测试，验证项目完整性：

```bash
flutter test
```

测试全部通过时显示 `All tests passed!`。

## 用法

### 浏览器访问

项目启动后在 Chrome 中打开，页面展示首页标题 → 成员介绍 → 项目功能 → 发布说明，可滚动浏览全部内容。

### 修改页面内容

所有内容修改集中在 `lib/main.dart` 文件中，各组员修改对应的静态常量即可：

```dart
// 组员 A 陈嘉玲 → 首页标题与口号
static const String projectTitle = '...';
static const String projectSlogan = '...';

// 组员 B 廖春花 → 小组成员与分工
static const List<TeamMember> members = [ ... ];

// 组员 C 杨顺粉 → 项目功能列表
static const List<String> features = [ ... ];

// 组员 D 杨美媛 → 发布说明
static const List<String> releaseNotes = [ ... ];

// 组员 E 王怡婷 → 修改 AppBar 标题
// 在 Scaffold 的 appBar 中修改 title 文字

// 组员 F 岳沛珂 → 修改主题颜色
// 在 MaterialApp 的 theme 中修改 ColorScheme.fromSeed(seedColor: ...)
```

修改后重新运行 `flutter run -d chrome` 即可预览效果。

### 构建 Web 静态文件

```bash
flutter build web --base-href /group-cooperation-1/
```

构建产物位于 `build/web/` 目录。

> **注意：** `--base-href` 的值必须与 GitHub 仓库名完全一致，且前后都要有 `/`。

## 项目结构

```
group-cooperation-1/
├── lib/
│   └── main.dart              # 主入口，所有内容在此修改
├── test/
│   └── widget_test.dart        # 基础冒烟测试
├── web/
│   ├── favicon.png             # 网站图标
│   ├── index.html              # Web 入口 HTML
│   └── icons/                  # PWA 图标资源
├── android/                    # Android 平台配置
├── pubspec.yaml                # 项目配置与依赖声明
├── pubspec.lock                # 依赖版本锁定
├── analysis_options.yaml       # Dart 静态分析规则
├── LICENSE                     # MIT 许可证
└── README.md                   # 项目说明文档
```

## 小组成员与分工

| 角色 | 姓名 | 负责内容 | 分支名 |
|------|------|----------|--------|
| 组长 | 周伟佳 | 创建仓库、维护 main 分支、审核 PR、发布 GitHub Pages | `main` |
| 组员 A | 陈嘉玲 | 修改首页标题和项目口号 | `member-a-title` |
| 组员 B | 廖春花 | 整理小组成员介绍与任务分工 | `member-b-members` |
| 组员 C | 杨顺粉 | 整理项目功能列表 | `member-c-features` |
| 组员 D | 杨美媛 | 记录发布说明和访问地址 | `member-d-release` |
| 组员 E | 王怡婷 | 修改顶部导航栏（AppBar）标题与浏览器标签页标题 | `member-e-appbar` |
| 组员 F | 岳沛珂 | 修改应用主题颜色（`Colors.indigo`） | `member-f-theme` |

## 技术栈

| 技术 | 说明 |
|------|------|
| **Flutter** | 跨平台 UI 框架，本项目使用 Web 构建 |
| **Dart** | Flutter 编程语言 |
| **Material Design 3** | 内置 UI 设计语言 |
| **GitHub** | 代码托管与 Pull Request 审核 |
| **GitHub Pages** | 静态网页托管，通过 `gh-pages` 分支发布 |

### 项目依赖

| 依赖 | 版本 | 用途 |
|------|------|------|
| `flutter` | SDK | 核心框架 |
| `cupertino_icons` | `^1.0.8` | iOS 风格图标 |
| `flutter_test` | SDK | 单元测试 |
| `flutter_lints` | `^5.0.0` | 代码规范检查 |

## 在线访问地址

```
https://wendy-zhou6.github.io/group-cooperation-1/
```

> 由组长在所有 PR 合并、完成构建后更新。

如果页面显示空白，请稍等 1–3 分钟后刷新，或检查 `--base-href` 是否与仓库名一致。

## 分支结构

| 分支 | 内容 | 说明 |
|------|------|------|
| `main` | Flutter 源代码 | 所有协作开发基于此分支，组员修改通过 PR 合并 |
| `gh-pages` | `flutter build web` 生成的静态网页文件 | GitHub Pages 读取此分支对外发布网页 |

## 维护者

- **周伟佳**（组长）— 仓库管理员，负责审核 Pull Request 与发布部署

## 如何贡献

本项目采用 **Fork → 创建分支 → 修改 → Pull Request → 审核 → 合并** 的协作流程：

```
组员 Fork 仓库
   ↓
本地 git clone 自己的 fork
   ↓
git checkout -b member-x-xxx   # 创建自己的分支
   ↓
修改指定内容
   ↓
flutter test                   # 本地验证
   ↓
git add / commit / push
   ↓
在 GitHub 发起 Pull Request（目标：wendy-zhou6/group-cooperation-1 main）
   ↓
组长审核 → 合并 / 要求修改
   ↓
组长构建并发布到 gh-pages
```

## 许可证

[MIT](LICENSE) © 2026
