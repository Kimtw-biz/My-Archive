import '../../cores/values/app_image_path.dart';

enum TechSkill {
  techSkillAdobeXD(AppImagePath.techSkillAdobeXD),
  techSkillAndroid(AppImagePath.techSkillAndroid),
  techSkillAWS(AppImagePath.techSkillAWS),
  techSkillBlender(AppImagePath.techSkillBlender),
  techSkillCSharp(AppImagePath.techSkillCSharp),
  techSkillC(AppImagePath.techSkillC),
  techSkillDart(AppImagePath.techSkillDart),
  techSkillFigma(AppImagePath.techSkillFigma),
  techSkillFlutter(AppImagePath.techSkillFlutter),
  techSkillGCP(AppImagePath.techSkillGCP),
  techSkillGimp(AppImagePath.techSkillGimp),
  techSkillGithub(AppImagePath.techSkillGithub),
  techSkillGoogleWorkspace(AppImagePath.techSkillGoogleWorkspace),
  techSkillIOS(AppImagePath.techSkillIOS),
  techSkillKotlin(AppImagePath.techSkillKotlin),
  techSkillMicrosoftOffice(AppImagePath.techSkillMicrosoftOffice),
  techSkillMicrosoftTeams(AppImagePath.techSkillMicrosoftTeams),
  techSkillNoSql(AppImagePath.techSkillNoSql),
  techSkillNotion(AppImagePath.techSkillNotion),
  techSkillPostman(AppImagePath.techSkillPostman),
  techSkillSlack(AppImagePath.techSkillSlack),
  techSkillSQL(AppImagePath.techSkillSQL),
  techSkillTypescript(AppImagePath.techSkillTypescript),
  techSkillUnity(AppImagePath.techSkillUnity),
  techSkillZoom(AppImagePath.techSkillZoom);

  final String imagePath;

  const TechSkill(this.imagePath);

  static TechSkill parse(int index) => TechSkill.values[index];

  static List<TechSkill> parseAll(List<int> source) => source
      .map<TechSkill>(
        (e) => TechSkill.values[e],
      )
      .toList(growable: false);
}
