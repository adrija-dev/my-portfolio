import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/screens/widgets/text_widgets.dart';

class SkillsSectionWidget extends StatefulWidget {
  final Size size;

  const SkillsSectionWidget({super.key, required this.size});

  @override
  State<SkillsSectionWidget> createState() => _SkillsSectionWidgetState();
}

class _SkillsSectionWidgetState extends State<SkillsSectionWidget> {
  final List<Map<String, dynamic>> _skillsData = [
    {'name': 'Dart', 'icon': FontAwesomeIcons.dartLang, 'subtitle': 'Flutter Core'},
    {'name': 'C', 'icon': FontAwesomeIcons.code, 'subtitle': 'Procedural'},
    {'name': 'C++', 'icon': FontAwesomeIcons.terminal, 'subtitle': 'OOP Systems '},
    {'name': 'Java', 'icon': FontAwesomeIcons.java, 'subtitle': 'Backend App and Data Structures and Algorithms'},
    {'name': 'Python', 'icon': FontAwesomeIcons.python, 'subtitle': 'Data & Scripts'},
  ];

  final Map<int, bool> _hoveredStates = {};

  @override
  Widget build(BuildContext context) {
    final double width = widget.size.width;
    
    
    int crossAxisCount = width <= 600 ? 1 : (width <= 950 ? 3 : 5);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: widget.size.height * 0.04,
        horizontal: width * 0.05,
      ),
      child: Column(
        children: [
          TextWidget(
            sSize: widget.size,
            text: "Programming Skills",
            size: width > 600 ? 30 : 22,
            color: Colors.white,
            fw: FontWeight.bold,
          ),
          const SizedBox(height: 8),
          Container(
            height: 3,
            width: 50,
            decoration: BoxDecoration(
              color: AppColors.studio,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 35),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _skillsData.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              
              childAspectRatio: width <= 600 ? 3.8 : 1.15,
            ),
            itemBuilder: (context, index) {
              final skill = _skillsData[index];
              final bool isHovered = _hoveredStates[index] ?? false;

              return MouseRegion(
                onEnter: (_) => setState(() => _hoveredStates[index] = true),
                onExit: (_) => setState(() => _hoveredStates[index] = false),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  decoration: BoxDecoration(
                    color: isHovered 
                        ? AppColors.studio.withValues(alpha: 0.15) 
                        : Colors.white.withValues(alpha: 0.02),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: isHovered ? AppColors.studio : Colors.white.withValues(alpha: 0.1),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: width <= 600
                      ? Row(
                          children: [
                            FaIcon(skill['icon'], size: 24, color: Colors.white),
                            const SizedBox(width: 16),
                           
                            Expanded(
                              child: _buildCardText(skill['name'], skill['subtitle'], true),
                            ),
                          ],
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FaIcon(skill['icon'], size: 26, color: Colors.white),
                            const SizedBox(height: 10),
                            _buildCardText(skill['name'], skill['subtitle'], false),
                          ],
                        ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCardText(String title, String subtitle, bool isMobile) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: isMobile ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      children: [
        Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: Colors.white, 
            fontSize: 16, 
            fontWeight: FontWeight.w600, 
            fontFamily: 'Poppins',
          ),
        ),
        const SizedBox(height: 2),
        Text(
          subtitle,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Colors.white70.withValues(alpha: 0.5), 
            fontSize: 11, 
            fontFamily: 'Poppins',
          ),
        ),
      ],
    );
  }
}
