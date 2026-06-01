import 'package:flutter/material.dart';

void main() {
  runApp(const GroupFlutterPagesApp());
}

class GroupFlutterPagesApp extends StatelessWidget {
  const GroupFlutterPagesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '星火小组 · GitHub协作项目展示',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreen),
        useMaterial3: true,
      ),
      home: const TeamHomePage(),
    );
  }
}

class TeamHomePage extends StatelessWidget {
  const TeamHomePage({super.key});

  static const String projectTitle = '第七小组 Flutter Web 展示页';
  static const String projectSlogan = '用 GitHub 协作完成一次真实的小组项目发布';

  static const List<TeamMember> members = [
    TeamMember(role: '组长', name: '周伟佳', task: '创建仓库、维护 main 分支、审核 PR、发布 GitHub Pages'),
    TeamMember(role: '组员 A', name: '陈嘉玲', task: '修改首页标题和项目口号'),
    TeamMember(role: '组员 B', name: '廖春花', task: '补充成员介绍卡片与任务分工'),
    TeamMember(role: '组员 C', name: '杨顺粉', task: '补充项目功能列表'),
    TeamMember(role: '组员 D', name: '杨美媛', task: '补充发布说明和访问地址'),
    TeamMember(role: '组员 E', name: '王怡婷', task: '修改顶部导航栏（AppBar）标题'),
    TeamMember(role: '组员 F', name: '岳沛珂', task: '修改应用主题颜色'),
  ];

  static const List<String> features = [
    'Flutter Web 单页展示界面',
    '小组成员介绍与分工卡片',
    '项目功能列表展示',
    '发布说明与 GitHub Pages 访问地址',
    'GitHub Fork + Pull Request 协作流程演示',
  ];

  static const List<String> releaseNotes = [
    '源码维护在 main 分支，所有组员通过 PR 合并修改。',
    '使用 flutter build web 构建静态网页。',
    '构建产物发布到 gh-pages 分支，通过 GitHub Pages 访问。',
    '访问地址：https://wendy-zhou6.github.io/group-cooperation-1/',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('星火小组 · GitHub协作项目')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: const [
          HeroSection(),
          SizedBox(height: 20),
          MembersSection(),
          SizedBox(height: 20),
          FeaturesSection(),
          SizedBox(height: 20),
          ReleaseSection(),
        ],
      ),
    );
  }
}

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              TeamHomePage.projectTitle,
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(TeamHomePage.projectSlogan, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}

class MembersSection extends StatelessWidget {
  const MembersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('小组成员与分工', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        ...TeamHomePage.members.map((member) => MemberCard(member: member)),
      ],
    );
  }
}

class MemberCard extends StatelessWidget {
  const MemberCard({required this.member, super.key});

  final TeamMember member;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(child: Text(member.role.characters.last)),
        title: Text('${member.role}：${member.name}'),
        subtitle: Text(member.task),
      ),
    );
  }
}

class FeaturesSection extends StatelessWidget {
  const FeaturesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('项目功能', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            ...TeamHomePage.features.map((feature) => Text('• $feature')),
          ],
        ),
      ),
    );
  }
}

class ReleaseSection extends StatelessWidget {
  const ReleaseSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.indigo.shade50,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('发布说明', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            ...TeamHomePage.releaseNotes.map((note) => Text('• $note')),
          ],
        ),
      ),
    );
  }
}

class TeamMember {
  const TeamMember({required this.role, required this.name, required this.task});

  final String role;
  final String name;
  final String task;
}
